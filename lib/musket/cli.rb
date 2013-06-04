require 'musket'
require 'thor'

module Musket
  class CLI < Thor
    package_name "musket"
    map "-u" => :generate

    desc "generate [TEMPLATE] [FILENAME]", "generates a new file with the provided template and filename"
    def generate(template="", filename="")
      puts "Template: #{template}"
      puts "Filename: #{filename}"
    end

    desc "setup", "creates configuration directory and default templates"
    def setup
      Musket.initialize
    end
  end
end