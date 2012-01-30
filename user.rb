class User < ActiveRecord::Base

  include Extensions::User_UUID

  has_many :conversations, :dependent => :destroy
  has_many :connections, :dependent => :destroy
  has_many :connection_requests, :dependent => :destroy
  has_many :followers, :dependent => :destroy
  has_many :blocks, :dependent => :destroy
  has_many :topics, through: :conversations
  has_many :snippets, through: :topics
  has_many :user_invitations , :dependent => :destroy
  has_many :participants, class_name: "ConversationParticipant", dependent: :destroy
  has_many :ratings, :dependent => :destroy
  has_many :rated_conversations, :through => :ratings, :source => :conversations
  has_one :user_profile, :dependent => :destroy

  acts_as_authentic do |c|

    # email validations
    c.merge_validates_uniqueness_of_email_field_options({:message => "Email already registered."})
    c.merge_validates_format_of_email_field_options({:message => "Email not valid."})

    # password validations
    c.merge_validates_length_of_password_field_options({:minimum => 4, :message => "Minimum length of password is 4."})
    c.merge_validates_confirmation_of_password_field_options({:message => "Confirmation password does not match."})

     # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional

  attr_accessor :agree

  def deliver_password_reset_notification(url)
    reset_token
    UserMailer.password_reset_instructions(self,url).deliver
  end

  def deliver_user_activation(url)
    UserMailer.welcome_email(self,url).deliver
  end

  def deliver_user_credentials(url,pass)
    UserMailer.email_username(self,url).deliver
    UserMailer.email_password(self,url,pass).deliver
  end

  def activate
    self.update_attributes(:activated => true)
  end

  def reset_token
    reset_perishable_token!
  end

  def full_name
    self.user_profile.first_name + " " + self.user_profile.last_name
  end

  def conversations_all
    conversations = []
    self.participants.each do |p|
      conversations << p.conversation
    end
    conversations
  end

 # For conversations in which the user is a participant - Private A & B
  def ordered_conversations
    convs = participants(include: :conversations).map { |p| p.conversation }
    # As conversations can exist without snippets and so would have lesser priority,
    # this loop helps to get all conversation with snippets first and then the rest.
    #convs = conversations.find(:all, :joins => :participants, :order => "conversation_participants.is_active")
    #c1= []
    #c2 = []
    #convs.each do |c|
    #  if c.snippets.empty?
    #    c2 << c
    #  else
    #    c1 << c
    #  end
    #end
    #c1.sort! {|c1,c2| c2.snippets.last.updated_at <=> c1.snippets.last.updated_at}
    #c2.sort! {|c1,c2| c2.created_at <=> c1.created_at}
    #convs = (c1 + c2).uniq
    convs.sort_by do |c|
      begin 
        c.snippets.last.updated_at
      rescue
        c.created_at
      end
    end
    convs.reverse.sort_by {|c| c.participants.find_by_user_id(id).is_active }
  end
 
  # For Connections Conversations - Open A
  def connection_conversations
    conversations = []
    connections.each {|c| conversations += User.find(c.person_id).conversations.where("invitor_type = 3")}
    c1= []
    c2 = []
    conversations.each do |c|
      if c.snippets.empty?
        c2 << c
      else
        c1 << c
      end
    end
    c1.sort! {|c1,c2| c2.snippets.last.updated_at <=> c1.snippets.last.updated_at}
    c2.sort! {|c1,c2| c2.created_at <=> c1.created_at}
    conversations = (c1 + c2).uniq
    conversations.uniq
  end

end
