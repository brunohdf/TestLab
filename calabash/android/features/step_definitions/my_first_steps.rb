When(/^I enter "([^"]*)" into input field with id "([^"]*)"$/) do |text, id|
  enter_text("android.widget.EditText id:'#{id}'", text)
end