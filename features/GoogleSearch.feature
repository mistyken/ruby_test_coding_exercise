Feature: Google Search

  Scenario: As a user I can go to google and search for duck
    Given I can navigate to "google" search page
    When I enter "Duck" into the search bar
    And I click the search button
    Then I should see title of page containing "Duck" and show more than one search result
    Then I should see information related to "Duck" in headlines
