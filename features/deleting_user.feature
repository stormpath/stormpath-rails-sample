Feature: Deleting user with stormpath account

  Background:
    Given I am logged in

  Scenario: Delete user
    When I go to the users page
    And I delete user
    Then I should see no user