def ensure_page(page_object_class)
  return if @page.is_a?(page_object_class)
  @page = page_object_class.new(@driver, @config)
  @page.wait_for_page_load
end

Before do |scenario|
  @scenario = scenario
  @config = Config.load_config_file
  @driver = Selenium::WebDriver.for @config['browser']
  @driver.navigate.to(@config['urls']['google'])
end

After do
  if @scenario.failed?
    tags = @scenario.source_tag_names.map(&:downcase).map { |x| x.delete('@') }
    unless tags.include?('non-gui') || tags.include?('nongui')
      encoded_img = page.driver.browser.screenshot_as(:png)
      embed("data:image/png;base64,#{encoded_img}", 'image/png', '----- SCREENSHOT OF THE FAILURE -----')
    end
  end
  @driver.quit
end