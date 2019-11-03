Feature: Form Testing
      
  @HappyPath
  Scenario: Opening the Example Page successfully 
    Given I open Example page
    Then I see "Cypress Example" in the title

  @HappyPath
  Scenario Outline: Successful Field Entering - <testcase>
     Given I open Example page
     And I input "<name>" into the name field
     And I input "<class year>" into the class year field
     And I input "<weekday>" into the weekday field
     And I input "<email>" into the email field
     And I input "<password>" into the password field
     And I input "<confirm password>" into the confirm password field
     When the submission is successful
  Examples:
    | testcase                     | name   | class year | weekday | email             | password       | confirm password | 
    | All fields                   | Curtis | 2222       | Monday  | Curtis@Curtis.com | potato1234%!   | potato1234%!     |
    | All fields without optionals | Curtis | 2222       |         | Curtis@Curtis.com | potato1234%!   | potato1234%!     |


  @SadPath
  Scenario Outline: UnSuccessful Field Entering with <testcase>
     Given I open Example page
     And I input "<name>" into the name field
     And I input "<class year>" into the class year field
     And I input "<weekday>" into the weekday field
     And I input "<email>" into the email field
     And I input "<password>" into the password field
     And I input "<confirm password>" into the confirm password field
     When I hit submit button
     Then there are <error count> errors displayed
  Examples:
    | testcase                                             | name   | class year | weekday  | email             | password       | confirm password | error count |
    | All fields missing                                   |        |            |          |                   |                |                  | 4           |
    | Name missing                                         |        | 2222       | Monday   | Curtis@Curtis.com | potato1234%!   | potato1234%!     | 1           |
    | Class Year missing                                   | Curtis |            | Monday   | Curtis@Curtis.com | potato1234%!   | potato1234%!     | 1           |
    | Email missing                                        | Curtis | 2222       | Monday   |                   | potato1234%!   | potato1234%!     | 1           |
    | password missing                                     | Curtis | 2222       | Monday   | Curtis@Curtis.com |                | potato1234%!     | 2           |
    | confirm password missing                             | Curtis | 2222       | Monday   | Curtis@Curtis.com | potato1234%!   |                  | 1           |
    | password and confirm password mismatch               | Curtis | 2222       | Monday   | Curtis@Curtis.com | 1234567        | 123456789        | 1           |
    | password and confirm password less than 5 characters | Curtis | 2222       | Monday   | Curtis@Curtis.com | 1234           | 1234             | 1           |
    | invalid email address                                | Curtis | 2222       | Monday   | Curtis1234        | potato1234%!   | potato1234%!     | 1           |
    | invalid Weekday                                      | Curtis | 2222       | Saturday | Curtis@Curtis.com | potato1234%!   | potato1234%!     | 1           |
    | Class year is not a number                           | Curtis | abcd       | Monday   | Curtis@Curtis.com | potato1234%!   | potato1234%!     | 1           |
    