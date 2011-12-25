When /^I enter these details$/ do |array|
  array.hashes.each do |conv|
    fill_in "conversation_subject", with: conv[:subject]
    fill_in "conversation_description", with: conv[:description]
    fill_in 'conversation_group_name', with: conv[:group_name]
  end
end

Then /^it should get saved$/ do
  page.should have_content('was successfully created')
end

