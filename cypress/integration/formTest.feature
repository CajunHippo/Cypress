Feature: Form Testing
      
  Scenario: Opening the Example Page
    Given I open Example page
    Then I see "Cypress Example" in the title

  Scenario Outline: Field Entering
     Given I open Example page
     Then I see "<blah>" in the title
  Examples:
    | blah |
    | Cypress Example |