# Checkboxes
When /^I check "(.+)"$/ do |element|
  case element
  when /as anonymous/i
    check "conversation_as_anonymous"
  when /is private/i
    check 'conversation_is_private'
  else
    check element
  end
end

# for Buttons or Links(Case sensitive)
When /^I click on "(.+)"$/ do |element|
  click_link_or_button element
end

# for cases where id has to be clicked
When /^I click on .+"(.+)".*$/ do |id|
  find("##{id}").click
end

# select the select_tag('name/id/label_text') 'option'
When /^I select the "(.+)" "(.+)"$/ do |arg1, arg2|
  select arg2, from: arg1
end

# Select option from dropdown
When /^I select "(.+)" from "(.+)"$/ do |arg1, arg2|
  select arg1, from: arg2
end

When /^I click "(.+)"$/ do |arg1|
  click arg1
end

Then /^I should see "(.+)"$/i do |arg1|
  page.should have_content arg1
end

Then /^I should not see "(.+)"$/i do |arg1|
  page.should_not have_content arg1
end

Then /^I should be redirected to .+"(.+)" page$/ do |url|
  current_url.should match /#{url}/i
end

When /^I login$/ do
  login
end

Given /^I am logged in$/ do
  login
  puts current_url
end

def login
  visit login_path
  fill_in "user_session_email", with: 'something@example.com'
  fill_in "user_session_password", with: @tester.password
  click_link_or_button 'login'
end

When /^I select the option .*"(.+)"$/ do |option|
puts "***Add '#{option}' element***"
pending
  find(option).click
end

# fill in 'controller_field' with 'value'
When /^I fill in "(.+)" with "(.+)"$/ do |field, value|
  @field = field.split(/\s/).join('_')
  fill_in @field, with: value
end
# Enter key pressed on the associated field
When /^I press Enter while on the field$/ do
  find_field(@field).native.send_key(:enter)
end

# Add a picture to a database field with the name model_img 
When /^add a "(.+)" picture "(.+)"$/ do |model, img|
  attach_file(model+'_img', 'features/images/' + img)
end

# For images, their Alt values can be treated as links
When /^I click on the Exit button$/ do
  click_link 'Btn_logout'
end

