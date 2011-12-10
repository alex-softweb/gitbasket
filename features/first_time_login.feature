Feature: User visits the site for the first time
In order to know what sidibat is about
As a new user
I want to visit the sidibat site and create an account
  
  Scenario: Visiting the about SIDIBAT page
    Given I am on the main conversation page
    When I click on "About SIDIBAT"
    Then I get to see what SIDIBAT is about  

  @javascript
  Scenario: Creating a new account with an email
    Given I am on the main conversation page
    When I enter the following details
      | first_name  | last_name |       email     | password |
      | alex        | john      |alex@example.com | india    |
      | tim         | galecknas | tim@example.com | india    |
    And I Sign Up
    Then my new account should be created

  Scenario: Creating a new account with Facebook
    Given I am on the main conversation page
    When I select the option to "Sign up with Facebook"
    And I enter my "login id" and password
    Then my new account should be created
