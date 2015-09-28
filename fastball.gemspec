# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastball/version'

Gem::Specification.new do |spec|
  spec.name          = "fastball"
  spec.version       = Fastball::VERSION
  spec.authors       = ["Jordan Bach"]
  spec.email         = ["jordanbach@gmail.com"]

  spec.summary       = %q{The safest, fastest way to build and deploy dynamic applications.}
  spec.homepage      = "https://github.com/jbgo/fastball"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["fastball"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
