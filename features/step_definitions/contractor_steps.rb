Given(/^the contractor exists with e\-mail "([^"]*)" and password "([^"]*)"$/) do |email, password|
  steps %{
    Given I visit the landing page
    And I click link "Register as a Contractor"
    And I fill in field "First Name" with "Bob"
    And I fill in field "Last Name" with "Jackson"
    And I fill in field "Email" with "#{email}"
    And I fill in field "Password" with "#{password}"
    And I fill in field "Password Confirmation" with "#{password}"
    And I fill in field "Company" with "Bob's Plumbing Inc"
    And I fill in field "Address" with "6107 nw 183 ln"
    And I fill in field "City" with "Miami Lakes"
    And I fill in field "State" with "Florida"
    And I fill in field "Zip Code" with "33015"
    And I fill in field "Country" with "USA"
    And I click on "Submit"
  }
end

Given(/^I log in as contractor "([^"]*)" with password "([^"]*)"$/) do |email, password|
  steps %{
    Given I am on the landing page
    And I click on "Sign In"
    Then I should see "Sign In Form"
    And I fill in field "Email" with "#{email}"
    And I fill in field "Password" with "#{password}"
    And I click on "Log In"
  }
end

Given(/^I attach a pdf file with a certificate$/) do
  attach_file('file', File.join(RAILS_ROOT, 'features', 'upload-files', 'certificate.pdf'))
  click_button 'Send file'
end

# When /^I upload a malformed file$/ do
# attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload-files', 'products_csv_bad.csv'))
# click_button "Send file"
# end
