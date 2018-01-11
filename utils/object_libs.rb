require 'timeout'

# Methods required to interact with webelements
module ObjectLibs
  # returns the reference to the web element by name or descriptor hash
  def select(descriptor)
    selector = element_selector(descriptor)
    wait_until_present(selector)
    @driver.find_element(selector)
  end

  def click(button_name)
    button = select(button_name)
    scroll_to_element(button) unless button.displayed?
    wait_until_enabled(button_name)
    button.click
  rescue Selenium::WebDriver::Error::UnknownError
    sleep(2)
    button.send_keys(:space)
  end

  def input(input_name, value)
    field = select(input_name)
    scroll_to_element(field) unless field.displayed?
    wait_until_enabled(input_name)
    wait_until_visible(input_name)
    field.clear
    field.send_keys(value) unless value == ''
  end

  def present?(element_name)
    element = select(element_name)
    scroll_to_element(element) unless element.displayed?
    wait_until_enabled(element_name)
    element ? element.present? : false
  end

  def included?(element, text)
    select(element).text.include?(text)
  end

  def select_option(element_name, option)
    dropdown = select(element_name)
    scroll_to_element(dropdown) unless dropdown.displayed?
    wait_until_enabled(element_name)
    options = dropdown.find_elements(tag_name: 'option')
    options.each { |opt| opt.click if opt.text == option }
  end

  def find_definition(descriptor)
    current_class = self.class
    while current_class
      return current_class.definitions[descriptor] if current_class.definitions[descriptor]
      current_class = current_class.superclass
    end
    fail(ElementNotDefined, "#{descriptor} is not defined")
  end

  def element_selector(descriptor)
    return descriptor if descriptor.is_a?(Hash)
    descriptor = descriptor.delete(' ').underscore unless descriptor.is_a?(Symbol)
    selector = find_definition(descriptor.to_s)
    fail(ElementNotDefined, "#{descriptor} is not defined") unless selector
    selector
  end

  def wait_until(element)
    wait.until { present?(element) }
  end

  def wait_until_value(element)
    elem = select(element)
    wait.until { elem.attribute('value') != '' }
  end

  def scroll_to_element(elem)
    elem = select(elem) unless elem.is_a?(Selenium::WebDriver::Element)
    instruction = 'arguments[0].scrollIntoView()'
    @driver.execute_script(instruction, elem)
  end

  def wait_until_present(descriptor)
    selector = element_selector(descriptor)
    long_wait.until { @driver.find_element(selector).present? }
  end

  def wait_until_not_present(descriptor)
    selector = element_selector(descriptor)
    wait.until { @driver.find_elements(selector).empty? }
  end

  def wait_until_enabled(descriptor)
    selector = element_selector(descriptor)
    wait.until { @driver.find_element(selector).enabled? }
  end

  def wait_until_visible(descriptor)
    selector = element_selector(descriptor)
    wait.until { @driver.find_element(selector).displayed? }
  end

  def wait_until_not_visible(descriptor)
    selector = element_selector(descriptor)
    wait.until { !@driver.find_element(selector).displayed? }
  end

  def verify_displayed?(descriptor)
    selector = element_selector(descriptor)
    !@driver.find_elements(selector).empty?
  end

  def accept_alert
    @driver.switch_to.alert.accept
  rescue Selenium::WebDriver::Error::NoAlertOpenError => ex
    log_error('Expected alert to be opened', error: ex)
  end

  def error_message(selector)
    if selector.is_a?(String) || selector.is_a?(Symbol)
      element = select(selector)
      element.attribute('data-error')
    elsif selector.is_a?(Hash)
      @driver.find_element(selector).attribute('data-error')
    else
      fail(ElementDescriptorError)
    end
  end

  def exists?(descriptor)
    selector = element_selector(descriptor)
    begin
      @driver.find_element(selector)
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end
  end

  def update_definition(element_name, selector)
    self.class.definitions[element_name.to_s] = selector
  end

  # Clears the radio button selection.  Used to make sure a radio button is not selected
  # It was not possible to set the attribute 'checked' to false other than by JS interaction.
  def clear_radio(radio_name)
    radio = select(radio_name)
    scroll_to_element(radio) unless radio.displayed?
    instruction = 'arguments[0].checked = false'
    @driver.execute_script(instruction, radio)
  end

  def scroll_to_top
    instruction = 'window.scrollTo(0, 0)'
    @driver.execute_script(instruction)
  end
end
