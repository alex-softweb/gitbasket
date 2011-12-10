Given /^I am on a conversation main page$/ do
  visit user_path(1)
end

When /^I fill in "([^"]*)"$/ do |arg1|
  @topic = arg1
  fill_in "topic_heading", with: arg1
end

When /^I press Enter$/ do
  find_field('topic_heading').native.send_key(:enter)
end

Then /^I should see a new topic page$/ do
  page.should have_content @topic
end

Given /^I am on the new topic page$/ do
  page.should have_content "Start a New Topic"
end

When /^I enter email addresses or Sidibat Ids of others$/ do
pending
end

When /^I select the profile 'test'$/ do
  pending # express the regexp above with the code you wish you had
end

When /^click on 'post'$/ do
  pending # express the regexp above with the code you wish you had
end

When /^select mood 'green'$/ do
  pending # express the regexp above with the code you wish you had
end


