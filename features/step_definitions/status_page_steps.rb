Given /^nobody has given me their email address$/ do
end

When /^I go to see my collected results$/ do
  visit '/status'
end

Then /^I should see (\d+) email addresses collected$/ do |arg1|
  page.should have_content("0 email addresses collected")
end

