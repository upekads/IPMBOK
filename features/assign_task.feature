Feature: assign task

  Scenario: Assign Task

    Given I am a Manager
    And I am signed in
    And One project is already exist in the system
    When I click link for managing document
    Then I can open document which I would like to assign task
    When I click a document link
    Then I should see button assign to create and go to assign task page
    When I click on assign to create button
    Then I fill the form
    Then I click submit button
    Then I should not see button for assigning a task
