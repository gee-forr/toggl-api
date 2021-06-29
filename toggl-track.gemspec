# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toggl_track/version'

Gem::Specification.new do |spec|
  spec.name          = "toggl-track"
  spec.version       = TogglV8::VERSION
  spec.authors       = ["Tom Kane", "Gabriel Fortuna"]
  spec.email         = ["kexf7pqsdu@snkmail.com", "gee.forr@gmail.com"]
  spec.summary       = %q{Toggl Track API Client (See https://github.com/toggl/toggl_api_docs)}
  spec.homepage      = "https://github.com/gee-forr/toggl-api/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.requirements  << 'A Toggl Track account (https://toggl.com/track)'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "fivemat"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rubocop"


  spec.add_dependency "faraday"
  spec.add_dependency "logger"
  spec.add_dependency "oj"
end
