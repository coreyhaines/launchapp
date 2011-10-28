Feature: Downloading details about interested parties
  In order to spam people about my new awesome product
  As an entrepreneur
  I want to download details about interested parties

  Scenario: Nobody is interested
    Given nobody has given me their email address
    When I download the interested party details as csv
    Then I should have an empty csv

