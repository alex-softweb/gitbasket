
Given /^I am on the getting started page$/ do
puts "***add the getting started path to conversations***"
pending
  visit getting_started_path
end

When /^I hover the mouse over "([^"]*)"$/ do |arg1|
pending "selenium does not seem to work with hover, need to explore Culerity"
  fireEvent(arg1,"hover")
end

Then /^I should see information on the topic$/ do
puts "Need client input on what the content should be"
pending
  page.should have_content("This information has to be added as per design requirements")
end

Then /^I should see the Complete Profile page$/ do
  current_path.should match 'complete_profile'
end

