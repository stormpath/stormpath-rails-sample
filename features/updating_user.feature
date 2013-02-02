Feature: Updating user with stormpath account
  Background:
    Given I am logged in

  Scenario: Update user
    When I go to the edit user page
    And I update user
    Then I should see updated user details

  @stormpath
  Scenario: Update user without email
    When I go to the edit user page
    And I update user without email
    Then I should see form error