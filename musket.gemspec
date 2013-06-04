# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'musket/version'

Gem::Specification.new do |spec|
  spec.name          = "musket"
  spec.version       = Musket::VERSION
  spec.authors       = ["Aniket Pant"]
  spec.email         = ["me@aniketpant.com"]
  spec.description   = %q{musket is a gem which can be used to generate front-end templates. It is capable for creating HTML, CSS and JS files with the basic requirements.}
  spec.summary       = %q{RubyGem for generating front-end templates}
  spec.homepage      = "https://github.com/aniketpant/musket"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "mote"
end
