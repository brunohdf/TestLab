require 'calabash-android/calabash_steps'

Then(/^I wait for dialog to close$/) do
  wait_for(timeout:5) { element_does_not_exist "android.app.ProgressDialog"}
end

Then(/^I scroll down events$/) do
  scroll("android.support.v7.widget.RecyclerView", :down)
end

Then(/^I scroll up events$/) do
  scroll("android.support.v7.widget.RecyclerView", :up)
end

Given(/^I'm on (.+)$/) do |activity|
  wait_for_activity activity
end

Then(/^I hide the keyboard$/) do
  hide_soft_keyboard()
end