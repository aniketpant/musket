require 'musket/configuration'
require 'musket/version'

require 'mote'
require 'fileutils'
require 'yaml'

module Musket
  CONFIG_DIR = Dir.home + '/.musket/'
  CONFIG_FILE = CONFIG_DIR + 'config.yml'
  TEMPLATE_DIR = CONFIG_DIR + 'templates/'

  class << self
    def load_config
      @config = Musket::Configuration.read if File.exists?CONFIG_FILE
    end

    def templates
      d = Dir.new(TEMPLATE_DIR)
      template_list = []
      d.each {
        |f|
        template_name = File.basename(f, '.mote')
        template_list.push(template_name) if template_name != '.' and template_name != '..'
      }
      return template_list
    end

    def generate(template, filename)
      self.load_config
      filename = "musket" if filename == ''
      template_file = TEMPLATE_DIR + "#{template}.mote"
      f = File.open(template_file)
      output = Mote.parse(f.read, self, [:author]).call([author: @config["author"]])
      current_dir = Dir.pwd
      new_file = File.open(current_dir + "/#{filename}.#{template}", 'w')
      new_file.puts(output)
      new_file.close
    end

    def install
      Musket::Configuration.create unless File.exists?CONFIG_FILE
      Musket::Configuration.copy_templates unless File.exists?TEMPLATE_DIR
    end
  end
end