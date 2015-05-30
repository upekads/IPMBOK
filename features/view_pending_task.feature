Feature: view pending task in home page

  Scenario: view pending task in home page

    Given I am signed in as a manager or team member
    Then I can go to home page
    And I should see my pending task in home page
    And I should see the button to go to document page
    Then I can go to a document page
    When I click the button to view document
