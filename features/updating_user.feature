Feature: Updating user with stormpath account
  Background:
    Given existing user

  Scenario: Update user
    When I go to the edit user page
    And I update user
    Then I should see updated user details

  Scenario: Update user without email
    When I go to the edit user page
    And I update user without email
    Then I should see form error