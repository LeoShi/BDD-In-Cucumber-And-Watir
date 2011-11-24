module Navigation
  def on(page,&block)
    @browser = Browsers.get_browser
#    puts @browser.inspect
#    puts "...page.url=#{page.url},#{page.url.inspect}"
    @browser.goto(page.url)
    page.new(@browser).instance_eval(&block) if block_given?
  end
end