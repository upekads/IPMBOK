Feature: manager

  Scenario: Create Project

 Manager should be able to create a project and edit project. After he assigns some other project manager, then he can not edit project

    Given I am a Manager
    And I am signed in
    Then I can go to project page and should see a button for new project
    When I click the button for the new project
    Then I should see a form to add a project
    When I submit the form
    Then I should see the details of my project
    And I should see the link to edit my project