module Musket
  class Configuration
    def self.read
      config = File.open(CONFIG_FILE, 'r')
      output = YAML.load(config.read)
      return output
    end

    def self.create
      FileUtils.mkdir(CONFIG_DIR) unless File.exists?CONFIG_DIR
      config = File.open(CONFIG_FILE, 'w+')
      data = {
        'author' => 'TODO: Write Author Name',
        'twitter' => 'TODO: Write Twitter Handle'
      }
      config.puts(data.to_yaml)
      config.close
    end

    def self.copy_templates
      FileUtils.mkdir(TEMPLATE_DIR) unless File.exists?TEMPLATE_DIR
      FileUtils.cp_r File.expand_path('../../templates', File.dirname(__FILE__)), CONFIG_DIR
    end
  end
end