Feature: Starting a new topic
In order to start a new topic
As a sidibat user 
I want to use the start a new topic page

  @javascript
  Scenario: Starting a new topic
    Given I am on a conversation main page
    When I click on Start a New "topic"
    And I fill in "My first topic"
    And I press Enter
    Then I should see a new topic page

  Scenario: Using the detailed start a new topic page
    Given I am on the new topic page
    When I enter <email> addresses of others
    And I enter <sidibat_id> of my friends
    And I select the profile 'test'
    And click on 'post'
    And select mood 'green'
    Then I should see "Invites sent"
