class Object
  def method_missing(name, *args)
#    puts "method missing:#{name}\n args:#{args}"
    validate_dirs = persona_dirs
    persona_name = args.first
    persona_type = name.to_s.split('_').last
#    puts "validate_dirs:#{validate_dirs}"
#    puts "persona_name:#{persona_name}"
#    puts "persona_type:#{persona_type}"
    super unless validate_dirs.include?(persona_type)
    to_persona(persona_type,persona_name)
  end

  def to_persona(persona,persona_name)
#    puts "to_persona:#{persona}\tpersona_name:#{persona_name}"
    Kernel.const_get(persona).new(persona_name)
#    persona.to_sym.new(persona_name)
  end
end

def persona_dirs
  persona_dir_list =[]
  current_dir = File.join(File.dirname(__FILE__),"persona")
  Dir.foreach(current_dir) do |dir_name|
    next if (dir_name == "." or dir_name == "..")
    persona_dir_list << dir_name if (File.directory?(File.join(current_dir, dir_name)))
  end
  persona_dir_list
end


def define_user_transform
  current_dir = File.join(File.dirname(__FILE__),"persona")
  persona_dirs.each do |dir|
    persona_names = Dir.entries(File.join(current_dir, dir)).
        select { |entry| File.extname(entry) == ".yml" }.
        collect{ |entry| File.basename(entry,".yml")}.
        join('|')
     puts "persona_names:#{persona_names}"
    Transform Regexp.new("^(#{persona_names})") do |persona_name|
#       puts "Transform:#{persona_name}"
       send "to_#{dir}",persona_name
    end
  end
end