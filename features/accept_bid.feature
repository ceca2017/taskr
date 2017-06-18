Feature: Requester to accept bid
  As a requester
  In order to agree with the chosen contractor on the task required
  I should see a page with an agreement for me to confirm

  Background:
    Given there are two reqesters having several tasks each belonging to some categories
    And the contractor exists with e-mail "con@a.com" and password "12345678" and is logged in
    And I click on "Current Available Tasks"
    And I click on "Bad mowing machine"
    And I fill in field "Quote:" with "500"
    And I click on "Make Offer"
    And I click on "Log Out"


  Scenario: Link to accept bid is not visible to others than the requester creating the task
    Given I log in as requester "requester1@r.com" with password "12345678"
    And I click on "Current Available Tasks"
    And I click on "Bad mowing machine"
    Then I should not see "Accept bid"
    Given I click on "Log Out"
    Given I log in as requester "requester2@r.com" with password "12345678"
    And I click on "Current Available Tasks"
    And I click on "Bad mowing machine"
    Then I should see "Accept bid"

  Scenario: Cli
