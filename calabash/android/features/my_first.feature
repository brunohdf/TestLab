Feature: Form validation
This feature validates my register form

  Scenario: I enter a name > I see the new screen with the Name
  	Given I wait for the "MainActivity" screen to appear
    When I enter "Alisson" into input field with id "edittext_name"
    And I press "Next"
    Then I see "Ok captain Alisson, you got it!"

  Scenario: I do not enter a name > I see a validation message
  	Given I wait for the "MainActivity" screen to appear
    When I press "Next"
    Then I see "Name is required"