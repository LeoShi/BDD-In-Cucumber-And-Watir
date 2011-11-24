require "watir"

def require_dir path
   Dir.foreach(path) do |entry|
     absolute_path = File.join(path,entry)
#     puts "absolut:#{absolute_path}"
     next if (entry == "." or entry == "..")
     require absolute_path if (File.extname(absolute_path) == ".rb")
     require_dir(absolute_path) if(File.directory?(absolute_path))
   end

end

current_dir = File.dirname(__FILE__)
require File.join(current_dir,"../../impl/page")
require File.join(current_dir,"../../impl/transform_persona")
require File.join(current_dir,"../../impl/navigation")
require File.join(current_dir,"../../impl/persona/user")
require_dir File.join(current_dir,"../../impl")

define_user_transform

Browsers = BrowserManager.new


Before do
  puts "before1111"
end

After do
   puts "after1111"
end

at_exit do
   puts  "at_exist1111"
end

