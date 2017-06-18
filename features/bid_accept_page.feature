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
    And I log in as requester "requester2@r.com" with password "12345678"
    And I click on "Current Available Tasks"
    And I click on "Bad mowing machine"
    And I click on "Accept Bid"

  Scenario: On bid accept page, check box and accept bid
    Given I check "terms_of_service" checkbox
    And I click on "Accept bid"
    Then I should see "You now have an agreement for this task. Congratulations!"


  Scenario: On bid accept page, do not check box and get message that bid cannot be accepted
    Given I click on "Accept bid"
    Then I should see "You need to check the box to accept the terms and conditions before a bid can be accepted."

  Scenario: After accepting a bid the status is set to 'Contracted' and it is not visible in the main list (so no new bids can be placed)
    Given I check "terms_of_service" checkbox
    And I click on "Accept bid"
    And I click on "View My Tasks"
    And I click on "Bad mowing machine"
    Then I should see "Status: Contracted"
    Given I click on "Current Available Tasks"
    Then I should not see "Bad moving machine"
