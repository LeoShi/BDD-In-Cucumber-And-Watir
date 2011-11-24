require "yaml"

class User
  include Navigation

  def initialize(name)
    @name =name
    init_property_from_config_file
  end

  private

  def define_class_attribute(attr_name)
    self.class.class_eval "attr_accessor:#{attr_name}"
  end

  def init_property_from_config_file
    config_file_path = File.join(File.dirname(__FILE__), "#{self.class.name}/#{@name}.yml")
    YAML.load_file(config_file_path).each do |attr_name, attr_value|
#      puts "key:#{attr_name}, value:#{attr_value}"
      define_class_attribute(attr_name)
      send "#{attr_name}=", attr_value
    end
  end

end