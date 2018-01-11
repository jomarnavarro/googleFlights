require_relative '../utils/object_libs.rb'
require_relative '../utils/window_libs.rb'
##
# Class to represent a PageObject
class PageObject
  include ObjectLibs
  include WindowLibs

  class << self
    attr_accessor :definitions, :driver

    def define(name, selector)
      @definitions = {} unless defined?(@definitions)
      fail(ElementAlreadyDefined, "Selector already defined: #{name}") if @definitions[name]
      @definitions[name.to_s] = selector
    end
  end

  def initialize(driver, config)
    @driver = driver
    @config = config
    @window_handles = @driver.window_handles
  end

  def long_wait
    @wait ||= Selenium::WebDriver::Wait.new(timeout: @config['timeouts']['long'])
  end

  def wait
    @wait ||= Selenium::WebDriver::Wait.new(timeout: @config['timeouts']['medium'])
  end

  def short_wait
    @short_wait ||= Selenium::WebDriver::Wait.new(timeout: @config['timeouts']['short'])
  end
end
