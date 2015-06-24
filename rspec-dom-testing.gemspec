# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-dom-testing/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-dom-testing"
  spec.version       = RSpecDomTesting::VERSION
  spec.authors       = ["Kir Shatrov"]
  spec.email         = ["shatrov@me.com"]

  spec.summary       = %q{Port of rails-dom-resting gem to RSpec}
  spec.description   = spec.summary
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "rspec", "~> 3.0"
  spec.add_dependency "rails-dom-testing", "~> 1.0"
  spec.add_dependency "actionpack", ">= 4.2.0", "< 6.0.0"
end
