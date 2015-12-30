Feature: Events feature

  Scenario: As a valid user I enter my credentials
    When I press "LOG IN"
    Then I wait
    Then I see "LOG IN"
    When I enter "felipets@ciandt.com" into input field number 1
    Then I hide the keyboard
    When I enter "turi1525" into input field number 2
    Then I hide the keyboard
    When I press "SAVE CREDENTIALS"
    Then I wait for dialog to close
    Then I see "ALL"

  Scenario: As a valid user I navigate between tabs
    Then I press "TICKETS"
    Then I wait for 1 seconds
    Then I press "INTERESTS"
    Then I wait for 1 seconds
    Then I press "LIKE"
    Then I wait for 1 seconds
    Then I press "ALL"
    Then I wait for 1 seconds

  Scenario: As a valid user I see the list of events
    Then I scroll down events
    Then I scroll down events
    Then I wait for 1 seconds
    Then I scroll up events
    Then I wait for 2 seconds

  Scenario: As a valid user I see details of an event
    Then I scroll down events
    Then I scroll down events
    Then I see "HACKATON 5"
    And I press "HACKATON 5"
    Given I'm on DetailActivity
    Then I wait for 1 seconds
    Then I go back


    



