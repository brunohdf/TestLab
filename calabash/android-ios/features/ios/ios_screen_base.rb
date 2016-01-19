require 'calabash-cucumber/ibase'

class IOSScreenBase < Calabash::IBase
  def self.element(element_name, &block)
    define_method(element_name.to_s, *block)
  end

  class << self
    alias_method :value, :element
    alias_method :action, :element
    alias_method :trait, :element
  end

  element(:loading_screen)            { 'LOADING' }

  # The progress bar of the application is a custom view
  def wait_for_progress
    sleep(2)
    wait_for(timeout: 10) { element_does_not_exist "* marked:'#{loading_screen}'" }
  end

  def has_text?(text)
    !query("* {text CONTAINS[c] '#{text}'}").empty? ||
      !query("* {accessibilityLabel CONTAINS[c] '#{text}'}").empty?
  end

  def drag_to(direction, element = nil)
    element = 'tableView' if element.nil?
    scroll(element, direction)
    sleep(1)
  end

  # In the iOS, an element could be found from its text or its accessibilityLabel
  # so this function looks for these two properties on the screen. When the query
  # looks for just a part of the text (CONTAINS[c]) then we need to specify if
  # we will look in accessibilityLabel or in any other propertie (marked)
  def ios_element_exists?(query)
    second_query = nil

    if query.include? 'CONTAINS[c]'
      if query.include? 'marked'
        second_query = query.gsub('marked', 'accessibilityLabel')
      end
      if query.include? 'accessibilityLabel'
        second_query = query.gsub('accessibilityLabel', 'marked')
      end
    end

    if second_query.nil?
      return element_exists(query)
    else
      element_exists(query) || element_exists(second_query)
    end
  end

  def drag_until_element_is_visible_with_special_query(direction, element)
    drag_until_element_is_visible direction, element,
                                  "* {accessibilityLabel CONTAINS[c] '#{element}'}"
  end

  def drag_until_element_is_visible(direction, element, query = nil, limit = 15)
    i = 0

    query = "* marked:'#{element}'" if query.nil?

    sleep(1)
    while !ios_element_exists?(query) && i < limit
      drag_to direction
      i += 1
    end

    fail "Executed #{limit} moviments #{direction} and the "\
         "element '#{element}' was not found on this view!" unless i < limit
  end

  def drag_for_specified_number_of_times(direction, times)
    times.times do
      drag_to direction
    end
  end

  # Negation indicates that we want a page that doesn't has
  # the message passed as parameter
  def is_on_page?(page_text, negation = '')
    should_not_have_exception = false
    should_have_exception = false
    begin
      wait_for(timeout: 5) { has_text? page_text }
      # If negation is not nil, we should raise an error
      # if this message was found on the view
      should_not_have_exception = true unless negation == ''
    rescue
      # only raise exception if negation is nil,
      # otherwise this is the expected behaviour
      should_have_exception = true if negation == ''
    end

    fail "Unexpected Page. The page should not have: '#{page_text}'" if
      should_not_have_exception

    fail "Unexpected Page. Expected was: '#{page_text}'" if
      should_have_exception
  end

  def enter(text, element, query = nil)
    query = "* marked:'#{element}'" if query.nil?

    begin
      wait_for(timeout: 5) { element_exists query }
    rescue
      # Just a better exception message
      raise "Element '#{element}' not found on view!"
    end

    touch query
    # Waits up to 20 seconds for the keyboard to show up
    begin
      wait_for(timeout: 10) { element_exists("view:'UIKeyboardAutomatic'") }
    rescue
      # If the keyboard didn't show up, tries another time
      # before rainsing the error message
      touch query
      wait_for(timeout: 5) { element_exists("view:'UIKeyboardAutomatic'") }
    end

    keyboard_enter_text text
  end

  def touch_screen_element(element, query = nil)
    query = "* marked:'#{element}'" if query.nil?
    begin
      wait_for(timeout: 5) { element_exists(query) }
      touch query
    rescue => e
      raise "Problem in touch screen element: '#{element}'\nError Message: #{e.message}"
    end
  end

  def touch_element_by_index(id, index)
    query = "* marked:'#{id}' index:#{index}"
    wait_for(timeout: 5) { element_exists(query) }
    touch(query)
  end

  def clear_text_field(field)
    clear_text("textField marked:'#{field}'")
  end

  def select_date_on_date_picker(date, date_picker_field_id)
    # Touch the date picker element
    touch_screen_element date_picker_field_id
    # Waiting for the date picker to show up
    wait_for(timeout: 5) { element_exists("view:'UIDatePicker'") }

    # If date is today, then we have nothing to do
    if date.year != DateTime.now.year ||
       date.month != DateTime.now.month ||
       date.day != DateTime.now.day
      # Selecting 'date' on the date picker
      picker_set_date_time date
    end

    # Touch the OK button
    touch_screen_element 'Ok'
  end

  def touch_picker_item_by_index(index)
    label = query('pickerView', :delegate,
                  [{ pickerView: nil }, { titleForRow: index },
                   { forComponent: 0 }])

    # Exception if element no found
    fail "Picker item index #{index} not found." if label.nil?
    # Label is an array of 1 element. Just picking the first.
    label = label.first

    # Touching the first item using it's text and Javascript function
    uia(%[uia.selectPickerValues('{0 "#{label}"}')])

    # Touching the OK button to close the Picker
    touch "* marked:'OK'"
  end
end
