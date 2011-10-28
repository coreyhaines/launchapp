Given /^nobody has given me their email address$/ do
end

Given /^somebody has given me their email address$/ do
  InterestedParty.create email_address: "foo@example.com"
end

When /^I go to see my collected results$/ do
  visit '/status'
end

Then /^I should see (\d+) email address(?:es)? collected$/ do |count|
  page.should have_content("#{count} email addresses collected")
end

