Given /^I am not logged in$/ do
   UserSession.find.try(:destroy) 
end

When /^I fill in my credentials$/ do
fill_in "user_session_email", with: @tester.email
fill_in "user_session_password", with: @tester.password
end

Given /^I am logged in$/ do
  login
end

