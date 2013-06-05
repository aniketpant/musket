# Musket

musket is a gem which can be used to generate front-end templates. It is capable for creating HTML, CSS and JS files with the basic requirements.

## Installation

Add this line to your application's Gemfile:

    gem 'musket'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install musket

## Usage

### Setup

Run `musket setup`.

The `setup` command creates a `.musket` directory in your home folder. It contains a configuration file named `config.yml` which can be modified by you according to your need. It also creates a directory `templates` which houses all the templates which can be used by `musket`.

### List

Use `musket list` to get a list of available templates.

### Generate

`musket generate [TEMPLATE] [FILENAME]`

The TEMPLATE name provided should be a valid TEMPLATE name. The FILENAME is an optional field. If no FILENAME is supplied, it defaults to 'musket'.

The generated file has the name `FILENAME.TEMPLATE`.

## Creating templates

If you wish to create a template of your own, you can created them under `.musket/templates/`. The templates should have a `.mote` extension. You should read up on how [mote](https://github.com/soveran/mote) parses the templates.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
