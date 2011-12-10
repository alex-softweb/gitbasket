# Checkboxes
When /^I check "(.+)"$/ do |element|
  check element
end

# for Buttons or Links
When /^I click on "(.+)"$/ do |element|
  click_link_or_button element
end

# for cases where id has to be clicked
When /^I click on .+"(.+)".*$/ do |id|
  find("##{id}").click
end

Then /^I should see a new "(.+)" page$/ do |controller|
  url = controller.concat("s/new") 
  current_path.should match url
end

When /^I click "(.+)"$/ do |arg1|
  click arg1
end

Then /^I should see "(.+)"$/ do |arg1|
  page.should have_content arg1
end

Then /^I should not see "(.+)"$/ do |arg1|
  page.should_not have_content arg1
end

Then /^I should be on the "(.+)" page$/ do |url|
  current_url.should match url
end

def login
  visit login_path
  fill_in "user_session_email", with: @tester.email
  fill_in "user_session_password", with: @tester.password
  click_link_or_button 'login'
end

When /^I select the option .*"(.+)"$/ do |option|
puts "***Add '#{option}' element***"
pending
  find(option).click
end

#When /^I click on the button "([^"]*)"$/ do |arg1|
#  click_button arg1
#end

