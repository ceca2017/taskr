Feature: Contractor certificates and previous experience
  As a contractor,
  In order to apply for task postings,
  I must be able to provide proof of who I am ,
  And I may be required to provide proof of what I can do.

  Scenario:
    Given the contractor exists with e-mail "con@a.com" and password "12345678"
    And I log in as contractor "con@a.com" with password "123445678"
    And I click link "My dashbord"
    And I click link "My profile"
    And I click link "Update my profile"
    And I fill in field "Previous experience:" with "I have worked as carpenter for 5 years"
    And I fill in field "Attachment file name" with "Certificate"
    And I attach a pdf file with a certificate
    And I click on "Submit"
    Then I should see "I have worked as a carpenter for 5 years"
    And I should see "Certificate"
