class BrowserManager
  @@browser_list=[]

  def get_browser
    free_browsers = @@browser_list.select { |browser| !browser.occupy? }
    result_browser = free_browsers.first
    return result_browser.browser unless result_browser.nil?
    create_new_browser
  end

  def release_all
    @@browser_list.each{|browser| browser.occupy}
  end

  def close_all
    @@browser_list.each{|browser| browser.close}
  end

  private
  def create_new_browser
    watir_browser = Watir::Browser.new
    browser_new = Browser.new watir_browser
    @@browser_list << browser_new
    browser_new.occupy
    browser_new.browser
  end
end

class Browser
  attr_reader :browser

  def initialize browser
    @browser = browser
    @status = false
  end

  def occupy?
    @status
  end

  def occupy
    @status = true
  end

  def free
    @status = false
  end

  def close
    @browser.close
  end
end