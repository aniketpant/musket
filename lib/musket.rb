require 'mote'
require 'fileutils'

module Musket
  def self.initialize
    config_dir = Dir.home + '/.musket/'
    config_file = config_dir + 'config.yml'
    if File.exist?config_file
      config = File.open(config_file, 'r')
    else
      puts "#{config_file} does not exist. Creating file."
      FileUtils.mkdir(config_dir)
      config = File.open(config_file, 'w')
      config.puts('# This is the musket configuration file')
      config.close
    end
  end
end