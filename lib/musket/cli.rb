require 'musket'
require 'thor'

module Musket
  class CLI < Thor
    package_name "musket"
    map "fire" => :generate
    map "-l" => :list

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

    desc "new [TEMPLATE]", "creates a new template"
    def new(template="")
      templates = Musket.templates
      if templates.include? template
        puts "Template already exists."
      elsif template == ''
        puts "Please enter a template name."
      else
        Musket.new(template) if template != ''
      end
    end

    desc "setup", "creates configuration directory and default templates"
    def setup
      Musket.install
    end
  end
end