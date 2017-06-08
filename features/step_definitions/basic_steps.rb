Given(/^I go to the path "([^"]*)"$/) do |arg1|
  visit new_requestor_path
end

Given(/^I fill in field "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end

Given(/^I click on "([^"]*)"$/) do |text|
  click_link_or_button(text)
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).not_to have_content content
end
