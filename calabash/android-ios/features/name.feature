# language: en
Feature: Enter the name

  Scenario: I enter a name > I see the new screen with the Name
    Given I'm on the home screen
    When I type my name
    And click the next button
    Then I see my name on the screen

  Scenario: I do not enter a name > I see a validation message
      Given I'm on the home screen
      When I press "Next"
      Then I see my name on the screen
