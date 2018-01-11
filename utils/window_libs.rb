require 'timeout'

# General methods to work on window handles.
module WindowLibs
  CHECK_INTERVAL = 0.1

  def open_new_window(new_page)
    @driver.execute_script('window.open()')
    @window_handles = @driver.window_handles
    @driver.switch_to.window(@window_handles.last)
    @driver.navigate.to(new_page)
  end

  def close_new_window
    @window_handles = @driver.window_handles
    @driver.close
    @driver.switch_to.window(@window_handles.first)
    refresh
  end

  def window_handle
    window_handles = @driver.window_handles
    yield
    wait_for_new_handle(window_handles)
    (@driver.window_handles - window_handles).first
  end

  def wait_for_new_handle(window_handles)
    wait.until { @driver.window_handles.length > window_handles.length }
  end

  def switch_to_window_handle(window_handle)
    if block_given?
      old_handle = @driver.window_handle
      @driver.switch_to.window(window_handle)
      wait_until_url_not('about:blank')
      yield
      @driver.close
      @driver.switch_to.window(old_handle)
    else
      @driver.switch_to.window(window_handle)
    end
  end

  def wait_until_url(url_new_page)
    wait.until { @driver.current_url.end_with?(url_new_page) }
    @window_handles = @driver.window_handles
    @driver.switch_to.window(@window_handles.last)
  end

  def wait_until_url_not(url)
    wait.until { !@driver.current_url.include?(url) }
  end

  def wait_for_page_load
    wait.until { @driver.execute_script('return document.readyState') == 'complete' }
  end

  def wait_for_jquery_load
    wait.until { @driver.execute_script('return jQuery.active == 0') }
  end

  def refresh
    @driver.navigate.refresh
  end
end
