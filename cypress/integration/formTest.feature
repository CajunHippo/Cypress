Feature: The Facebook
      
  Scenario: Opening a social network page
    Given I open Google page
    Then I see "Google" in the title

  Scenario Outline: Opening a social network page2
    Given I open Google page
    Then I see "<blah>" in the title
  Examples:
    | blah |
    | Google |