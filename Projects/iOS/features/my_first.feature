Feature: Form validation
This feature validates my register form

  Scenario: I enter a name > I see the new screen with the Name
  	Then I wait
    Then I enter "Alisson" into the "name_field" field
    And I press "Next"
    Then I see the text "Ok captain Alisson, you got it!"

  Scenario: I do not enter a name > I see a validation message
  	Then I wait
    When I press "Next"
    Then I wait to not see "result_label"
