class NameScreen < AndroidScreenBase
  # The screen identificator
  trait(:trait)                 { "* id:'#{layout_name}'" }

  # Declare all the elements of this screen
  element(:layout_name)         { input_name }
  element(:input_name)          { 'edittext_name' }
  element(:button_next)         {'button_next'}

  # Declare all actions of this screen
  action(:touch_next) {
     touch("* id:'#{button_next}'")
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
