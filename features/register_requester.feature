Feature: Register account for requester
  As a visitor,
  In order to post task postings,
  I need to be able to apply for a user account using my credentials.

  Scenario:
    Given I go to the path "/requesters/sign_up"
    And I fill in field "First name" with "John"
    And I fill in field "Last name" with "Doe"
    And I fill in field "E-mail" with "requester@ab.com"
    And I fill in field "Password" with "12345678"
    And I fill in field "Password confirmation" with "12345678"
    And I click on "Submit"
    Then I should see "Thank you for your registration!"
