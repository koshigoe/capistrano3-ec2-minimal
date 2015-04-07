# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/ec2/minimal/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano3-ec2-minimal"
  spec.version       = Capistrano::Ec2::Minimal::VERSION
  spec.authors       = ["koshigoe"]
  spec.email         = ["koshigoeb@gmail.com"]

  spec.summary       = %q{This is an minimal ec2 support for Capistrano3 using AWS SDK v2. (like cap-ec2) }
  spec.description   = %q{This is an minimal ec2 support for Capistrano3 using AWS SDK v2. (like cap-ec2) }
  spec.homepage      = "https://github.com/koshigoe/capistrano3-ec2-minimal"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'capistrano', '~> 3.0'
  spec.add_dependency 'aws-sdk', '~> 2.0'
  spec.add_dependency 'terminal-table'
  spec.add_dependency 'colorize'
end
