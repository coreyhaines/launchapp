Given /^nobody has given me their email address$/ do
end

Given /^somebody has given me their email address$/ do
  InterestedParty.create email_address: "foo@example.com"
end

When /^I go to see my collected results$/ do
  visit '/status'
end

When /^I download the interested party details as csv$/ do
  visit '/status'
  click_link 'Download'
end

Then /^I should see (\d+) email address(?:es)? collected$/ do |count|
  page.should have_content("#{count} email addresses collected")
end

Then /^I should have an empty csv$/ do
  # expected_lines = expected_csv.split("\n").map(&:strip)
  page.response_headers['Content-Type'].should == "text/csv"
  actual_lines = page.text.split("\n")
  actual_lines.length.should == 1
  actual_lines.should == ["email_address"]
end

Then /^I should see the interested parties csv$/ do
  page.response_headers['Content-Type'].should == "text/csv"
  actual_lines = page.text.split("\n")
  actual_lines.length.should == 2
  actual_lines.should == ["email_address", InterestedParty.last.email_address]
end

