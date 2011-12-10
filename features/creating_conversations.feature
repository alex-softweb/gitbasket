Feature: User creates a conversation
As a User
I want to create a conversation
So that I can see my first conversation page
  
  @javascript
  Scenario: Creating a conversation
    Given the conversation page is loaded
    When I enter my conversation data
    And add a picture
    And I click on the "plus" button
    Then a new keydate field should be added
    And it should get saved

