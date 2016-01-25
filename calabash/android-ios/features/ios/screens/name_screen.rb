class NameScreen < IOSScreenBase
  # The screen identificator
  trait(:trait)                 { "* marked:'#{layout_name}'" }

  # Declare all the elements of this screen
  element(:layout_name)         { 'name_field' }
  element(:input_name)          { 'name_field' }
  element(:button_next)         { 'next_button' }

  # Declare all actions of this screen
  action(:touch_next) {
    touch("* marked:'#{button_next}'")
  }

  action(:enter_name) {
    enter 'Felipe', input_name
  }

  def contains_name?
    begin
      wait_for(timeout: 10) { element_exists "* {text CONTAINS 'Felipe'}" }
    rescue
      false
    end
    return true
  end

end
