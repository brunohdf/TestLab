######### GIVEN #########

######### WHEN #########

######### THEN #########

Given(/^I'm on the home screen$/) do
  @page = page(NameScreen).await(timeout: 5)
end

When(/^I type my name$/) do
  @page.enter_name
end

When(/^click the next button$/) do
  @page.touch_next
end

Then(/^I see my name on the screen$/) do
  fail "not found" unless @page.contains_name?
end
