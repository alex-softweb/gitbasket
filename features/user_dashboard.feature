Feature: User Dashboard
In order to get started with Sidibat
As a new user
I want to be able to use the getting started page

  @javascript
  Scenario: visiting the getting started page
    Given I am on the getting started page
    When I hover the mouse over "Start a konversation"
    And I hover the mouse over "Add My Konnections"
    And I hover the mouse over "Complete My Profile"
    Then I should see information on the topic

  @javascript
  Scenario: Visiting the complete profile page
    Given I am on the getting started page
    When I click on "Complete My Profile"
    Then I should see the Complete Profile page

  Scenario: Visiting the Start a conversation page
    Given I am on the getting started page
    When I click on "Start A Konversation"
    Then I should see a new "conversation" page
