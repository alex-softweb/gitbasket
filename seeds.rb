### User ###

User.create!(:first_name => 'test', :last_name => 'test', :user_type => 'user', :email => 'something@example.com', :password => 'test123', :password_confirmation => 'test123', :activated => 1, login_count: 2)
User.create!(:first_name => 'admin', :last_name => 'admin', :user_type => 'admin', :email => 'admin@example.com', :password => 'admin', :password_confirmation => 'admin')
UserProfile.create!(user_id: 1)

puts "User Created !!!"
puts "User email : something@example.com"
puts "password : test123"

### Moods ###
Mood.create!(name:'yellow', image: 'square_yellow.png')
Mood.create!(name:'sky_blue', image: 'square_sky_blue.png')
Mood.create!(name:'oren', image: 'square_oren.png')
Mood.create!(name:'blue', image: 'square_blue.png')
Mood.create!(name:'red', image: 'square_red.png')

### Content ###

Admin.create!(:page_name => 'Home Page', :page_content => '<ul class="listing">
	<li>
		Converse privately or openly...</li>
	<li>
		Converse as yourself, as an alter-ego or anonymously...</li>
	<li>
		Give advice for free or for a fee...</li>
	<li class="last">
		Organize your conversation into multiple groups or topics...</li>
</ul>
')

Admin.create!(:page_name => 'About Us', :page_content => '<p>
	this is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us page this is about us pagethis is about us page this is about us pagethis is about us pagethis is about us pagethis is about us page this is about us pagethis is about us pagethis is about us page this is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us pagethis is about us page this is about us pagethis is about us pagethis is about us pagethis is about us page this is about us pagethis is about us pagethis is about us pagethis is about us page this is about us pagethis is about us pagethis is about us page this is about us pagethis is about us page this is about us pagethis is about us pagethis is about us page this is about us pagethis is about us page this is about us pagethis is about us pagethis is about us page this is about us pagethis is about us page this is about us page</p>

')

Admin.create!(:page_name => 'Contact Us', :page_content => '<p>
	Contact us pageContact us pageContact us pageContact us pageContact us pageContact us pageContact us pageContact us pageContact us pageContact us pageContact us pageContact us page Contact us pageContact us page Contact us pageContact us pageContact us pageContact us pageContact us page Contact us pageContact us pageContact us page Contact us pageContact us pageContact us page Contact us pageContact us page Contact us pageContact us pageContact us pageContact us page Contact us pageContact us pageContact us page Contact us pageContact us page Contact us pageContact us page Contact us pageContact us pageContact us page Contact us pageContact us page Contact us pageContact us page Contact us pageContact us page Contact us pageContact us page Contact us pageContact us page Contact us pageContact us pageContact us page Contact us pageContact us page Contact us pageContact us page</p>
')

Admin.create!(:page_name => 'Terms & Condition', :page_content => '<p>
	terms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditions terms and conditionsterms and conditions terms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditions terms and conditionsterms and conditionsterms and conditions</p>
')

Admin.create!(:page_name => 'Privacy Policy', :page_content => '<p>
	privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policy privacy policy privacy policy privacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy privacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policyprivacy policy privacy policy</p>
')

Admin.create!(:page_name => 'Start a Konversation', :page_content => '<p>
	Click to start a conversation<br />
	&nbsp;&nbsp;&nbsp; You may invite any number of users</p>
')

Admin.create!(:page_name => 'View Open Konversations', :page_content => '<p>
	Currently Sidibat only provides access to private conversations.<br />
	&nbsp;&nbsp;&nbsp; Open conversations will be seen in the next phase.</p>
')

Admin.create!(:page_name => "See a Friend's Konversation", :page_content => '<p>
	Sidibat will provide access to your friends conversations<br />
	&nbsp;&nbsp;&nbsp; This will be seen in the next phase</p>
')

Admin.create!(:page_name => "Add my Konnections", :page_content => '<p>
	Click to add contacts from your Gmail, Yahoo or Facebook accounts<br />
	&nbsp;&nbsp;&nbsp; If your friends are on sidibat with the same contact, we will recommend your profile to them.</p>
')

Admin.create!(:page_name => "Complete My Profile", :page_content => '<p>
	Click to access your account details<br />
	&nbsp;&nbsp;&nbsp; You may add more information to your account</p>
')

puts "Admin pages Created!!!"
