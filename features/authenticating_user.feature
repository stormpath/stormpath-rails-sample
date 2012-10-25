Feature: Authenticating user
  In order to manage users
  As a user
  I want to authenticate

  Scenario: User sign in
    Given existing user
    When I go to the new user session page
    And I sign in with user email and password
    Then I should sign in successfully
