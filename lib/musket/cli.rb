require 'musket'
require 'thor'

module Musket
  class CLI < Thor
    package_name "musket"
    map "-u" => :generate

    desc "generate [TEMPLATE] [FILENAME]", "generates a new file with the provided template and filename"
    def generate(template="", filename="")
      templates = Musket.templates
      if templates.include? template
        Musket.generate(template, filename) if template != ''
      else
        puts "Please provide a valid template name!"
      end
    end

    desc "list", "lists available templates"
    def list
      templates = Musket.templates
      puts "List of available templates:"
      puts templates.join('\n')
    end

    desc "setup", "creates configuration directory and default templates"
    def setup
      Musket.install
    end
  end
end