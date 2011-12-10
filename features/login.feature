Feature: Logging and Loggin out
  In order to manage my account
  As a registered user
  I want to log in and out

  @javascript
  Scenario: Successful login
    Given I am not logged in
    And I go to the home page
    When I fill in my credentials
    And I click on "login"
    Then I should be on the "welcome" page
    And I should see "Logout"
    And I should not see "Login"

  @javascript
  Scenario: Successful logout
    Given I am logged in
    When I click on "Logout"
    Then I should see "Sign Up"
    And I should not see "Logout"
