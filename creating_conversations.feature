Feature: User creates a conversation
As a Sidibat User
I want to create a conversation
So that I can see my first conversation page

Background:
    Given I am logged in
  
  @javascript
  Scenario: Creating a conversation
    Given I am on the new conversation page
    When I enter these details
      | subject  |            description           | group_name |
      | Politics | Republicans, Liberals, Democrats |  General   | 

      And I check "As anonymous"
      And I check "Is private"
      And add a "conversation" picture "ubuntu.png"
    Then it should get saved

