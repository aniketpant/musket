module Musket
  class Configuration
    def self.read
      config = File.open(@config_file, 'r')
      config.push(YAML.load(config.read()))
      return config
    end

    def self.create
      FileUtils.mkdir(@config_dir) unless File.exists?@config_dir
      config = File.open(@config_file, 'w+')
      output = []
      output.push({'author' => 'TODO: Write Author Name'}.to_yaml)
      config.puts(output.join('\n'))
      config.close
    end

    def self.copy_templates
      FileUtils.mkdir(@template_dir) unless File.exists?@template_dir
      FileUtils.cp_r File.expand_path('../templates', File.dirname(__FILE__)), @config_dir
    end
  end
end