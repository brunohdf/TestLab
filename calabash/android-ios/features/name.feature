# language: en
Feature: Enter the name

  Scenario: First Scenario
    Given I'm on the home screen
    When I type my name
    And click the next button
    Then I see my name on the screen
