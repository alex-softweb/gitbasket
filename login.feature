Feature: Logging and Loggin out
  In order to manage my account
  As a registered user
  I want to log in and out

  @javascript
  Scenario: Logging in
    Given I am on the home page
    When I login
    Then I should be redirected to the user "dashboard" page
      And I should see "Login successful"

  @javascript
  Scenario: Successful logout
    Given I am logged in
    When I click on the Exit button
    Then I should see "Sign Up"

  @javascript
  Scenario: Forgot password
    Given I am on the home page
    When I click on "Forgot Password"
      And I fill in "email" with "something@example.com"
      And I click on "Reset my password"
    Then I should see "Instructions to reset your password have been emailed to you. Please check your email."
    
