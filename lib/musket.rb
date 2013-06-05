require 'musket/configuration'
require 'musket/version'

require 'mote'
require 'fileutils'
require 'yaml'

module Musket
  @config_dir = Dir.home + '/.musket/'
  @config_file = @config_dir + 'config.yml'
  @template_dir = @config_dir + 'templates/'

  def init
    @config = Musket::Configuration.read if File.exists?@config_file
  end

  class << self
    def templates
      d = Dir.new(@template_dir)
      template_list = []
      d.each {
        |f|
        template_name = File.basename(f, '.mote')
        template_list.push(template_name) if template_name != '.' and template_name != '..'
      }
      puts "List of available templates:"
      puts template_list.join('\n')
    end

    def generate

    end

    def install
      Musket::Configuration.create unless File.exists?@config_file
      Musket::Configuration.copy_templates unless File.exists?@template_dir
    end
  end
end