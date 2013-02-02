Feature: Creating user with stormpath account
  Background:
    Given I am logged in

  Scenario: Add user
    Given I am on the new user page
    When I create user
    Then I should see user details

  @stormpath
  Scenario: Add user without email
    Given I am on the new user page
    When I create user without email
    Then I should see form error
