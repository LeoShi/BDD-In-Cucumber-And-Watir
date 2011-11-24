class GooglePage < Page
  set_url "http://www.google.com"

  def input
    @browser.text_field(:id => "lst-ib")
  end
end

