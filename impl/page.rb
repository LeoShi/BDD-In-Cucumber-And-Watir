class Page
  attr_accessor :url

  def initialize browser
    @browser = browser
  end

  class << self
    def set_url url
#      meta_class = class << self
#        self
#      end
#      meta_class.send :define_method,"page_url" do
#        url
#      end
      @url=url
    end

    def url
#     page_url
      @url
    end
  end
end
