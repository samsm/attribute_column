# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attribute_column/version'

Gem::Specification.new do |spec|
  spec.name          = "attribute_column"
  spec.version       = AttributeColumn::VERSION
  spec.authors       = ["Sam Schenkman-Moore"]
  spec.email         = ["samsm@samsm.com"]
  spec.description   = %q{Apply types to attributes for use in form_for, etc.}
  spec.summary       = %q{Give attributes ActiveRecord-like types.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
