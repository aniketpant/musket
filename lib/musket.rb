require 'mote'
require 'fileutils'
require 'yaml'

module Musket
  def self.initialize
    @config_dir = Dir.home + '/.musket/'
    @config_file = @config_dir + 'config.yml'

    Musket.create_config unless File.exists?@config_file
    Musket.read_config if File.exists?@config_file
  end

  def self.read_config
    config = File.open(@config_file, 'r')
    @config = []
    @config.push(YAML.load(config.read()))
  end

  def self.create_config
    puts "#{@config_file} does not exist. Creating file."
    FileUtils.mkdir(@config_dir) unless File.exists?@config_dir
    config = File.open(@config_file, 'w+')
    output = []
    output.push({'author' => 'TODO: Write Author Name'}.to_yaml)
    config.puts(output.join('\n'))
    config.close
  end
end