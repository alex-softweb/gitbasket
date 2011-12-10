Given /^the conversation page is loaded$/ do
  visit new_conversation_path
  current_path.should match '/conversations/new'
end

When /^I enter my conversation data$/ do
  fill_in "conversation_subject", with: "First conversation"
  fill_in "conversation_description", with: "comma, separated, values"
  check "conversation_as_anonymous"
  fill_in 'conversation_key_dates', with: "11/11/11"
  check 'conversation_is_private'
  fill_in 'conversation_group_name', with: 'general'
end


When /^add a picture$/ do
  attach_file('conversation_img', '/home/test/Pictures/bird.jpeg')
end

Then /^a new keydate field should be added$/ do
  page.should have_content('conversation')
  all('#conversation_key_dates').length.should == 2
end

Then /^it should get saved$/ do
  click_button('Save')
  page.should have_content('was successfully created')
end

