Feature: Viewing the emails collected
  In order to gauge the interest in my idea
  As an entrepreneur
  I want to see how many email addresses I've collected


  Scenario: Nobody is interested
    Given nobody has given me their email address
    When I go to see my collected results
    Then I should see 0 email addresses collected

  Scenario: Somebody is interested
    Given somebody has given me their email address
    When I go to see my collected results
    Then I should see 1 email address collected
