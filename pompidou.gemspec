# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pompidou/version'

Gem::Specification.new do |spec|
  spec.name          = "pompidou"
  spec.version       = Pompidou::VERSION
  spec.authors       = ["John Friel"]
  spec.email         = ["john@johnfriel.net"]
  spec.summary       = %q{A scaffolding generator that makes assumptions about your app}
  spec.description   = %q{A scaffolding generator that makes assumptions about your app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '~> 4.0', '>= 4.0.1'
  spec.add_runtime_dependency 'railties',      '~> 4.0', '>= 4.0.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
