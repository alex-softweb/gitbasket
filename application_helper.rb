module ApplicationHelper
  class ActiveRecord::Base
    def errs
      self.errors.messages.values.join(' - ')
    end
  end

  module TrueFalseComparison
    def <=>(other)
      raise ArgumentError unless [TrueClass, FalseClass].include?(other.class)
      other ? (self ? 0 : 1) : (self ? -1 : 0)
    end
  end

  TrueClass.send(:include, TrueFalseComparison)
  FalseClass.send(:include, TrueFalseComparison)

  def display_login
    if request.url == check_email_url or request.url == new_password_url or request.url == create_password_url or request.url.split("?").first == edit_password_url
      return false
    else
      return true
    end
  end

  def footer_link(action)
    case action
      when 'new', 'dashboard'
        vhome='footer_bold'
      when 'about_us'
        vabout='footer_bold'
      when 'contact_us'
        vcontact='footer_bold'
      when 'terms'
        vterm='footer_bold'
      when 'privacy'
        vprivacy='footer_bold'
    end
    return vhome,vabout,vcontact,vterm,vprivacy
  end

  def link_to_submit(text)
    link_to_function text, "$(this).closest('form').submit()"
  end

  def rate_like_check(snippet)
    true if snippet.snippet_votes.find(:first, :conditions => ["user_id = ? and vote = ?", current_user.id, true])
  end

  def rate_dislike_check(snippet)
    true if snippet.snippet_votes.find(:first, :conditions => ["user_id = ? and vote = ?", current_user.id, false])
  end

  def rate_like_text(snippet)
    "%02d" % snippet.snippet_votes.where(vote: true).size
  end

  def rate_dislike_text(snippet)
    "%02d" % snippet.snippet_votes.where(vote: false).size
  end

  def limit(str, limiter)
    if str.size > limiter
      str[0..(limiter-3)] + "..."
    else
      str
    end
  end

  def rating_ballot
    if params[:snip_id]
      @conversation = Snippet.find(params[:snip_id]).topic.conversation
    elsif params[:conversation_id]
      @conversation = Conversation.find_by_uuid(params[:conversation_id])
    else
      @conversation = Conversation.find_by_uuid(params[:id])
    end
    if @rating = current_user.ratings.find_by_conversation_id(@conversation.id)
      @rating
    else
      current_user.ratings.new
    end
  end

  def user_rating_ballot
    if params[:snip_id]
      @conversation = Snippet.find(params[:snip_id]).topic.conversation
    elsif params[:conversation_id]
      @conversation = Conversation.find_by_uuid(params[:conversation_id])
    else
      @conversation = Conversation.find_by_uuid(params[:id])
    end
  	if params[:snip_id]
  		found_user = Snippet.find(params[:snip_id]).user
  		@rating = found_user.ratings.find_by_conversation_id(@conversation.id)
  	else
  		@rating = current_user.ratings.find_by_conversation_id(@conversation.id)
  	end

    if @rating
      @rating
    else
      current_user.ratings.new
    end
  end

  def current_user_rating
    if params[:snip_id]
      @conversation = Snippet.find(params[:snip_id]).topic.conversation
    elsif params[:conversation_id]
      @conversation = Conversation.find_by_uuid(params[:conversation_id])
    else
      @conversation = Conversation.find_by_uuid(params[:id])
    end
   	if params[:snip_id]
      found_user = Snippet.find(params[:snip_id]).user
  		@rating = found_user.ratings.find_by_conversation_id(@conversation.id)
  	else
  		@rating = current_user.ratings.find_by_conversation_id(@conversation.id)
  	end
    if @rating
      @rating.value
    else
      "N/A"
    end
  end

  def average_ratings
    if params[:conversation_id]
      @conversation = Conversation.find_by_uuid(params[:conversation_id])
    else
      @conversation = Conversation.find_by_uuid(params[:id])
    end
    @conversation.try(:average_rating).try(:round) || "N/A"
  end
end
