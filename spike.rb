result = ["abv","gha","ttyu","agt"].select{|item| item.start_with? "a"}
puts result.inspect

class Test
  def show
    puts "it's a test"
  end

  class << self
    def test
      class << self
        self
      end
    end

    def test1
      self
    end
  end
end

puts Test.inspect
puts Test.test.inspect
puts Test.test1.inspect
puts Test.new.inspect

#puts "Test".to_sym.new
#Kernel.const_get("Test").new.show

#require "yaml"
#
#path = %q"D:\Code\Ruby\DemoCucumber\impl\persona\SearchUser\Leo.yml"
#YAML.load_file(path).each do |key,value|
#  puts "key:#{key},value:#{value}"
#  self.class.class_eval("attr_accessor :#{key}")
#  send "#{key}=", value
#end


