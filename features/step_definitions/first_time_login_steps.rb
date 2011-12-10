Given /^I am on the main conversation page$/ do
  visit login_path
end

Then /^my new account should be created$/ do
page.should have_content "Logout"
#  page.html.should match /account [^']*created/
end

Then /^I get to see what SIDIBAT is about$/ do
puts "***Add the About sidibat page.***"
pending
  page.should have_content "about sidibat"
end

When /^I Sign Up$/ do
   find_field('user_first_name').native.send_key(:enter) 
end

When /^I enter the following details$/ do |table|
  table.hashes.each do |user|
    fill_in 'user_first_name', with: user[:first_name]
    fill_in 'user_last_name', with: user[:last_name]
    fill_in 'user_email', with: user[:email]
    fill_in 'user_password', with: user[:password]
    fill_in 'user_password_confirmation', with: user[:password]
    check 'user_agree'
  end
end

