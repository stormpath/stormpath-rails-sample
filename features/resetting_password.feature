Feature: Resetting password
  Background:
    Given user with real email

  @wip
  Scenario: Request reset password token
    When I go to the new user password page
    And I submit user email
    Then I should see that password reset email sent

  Scenario: Attempt to reset password without email
    When I go to the new user password page
    And I submit empty email
    Then I should see email validation error
