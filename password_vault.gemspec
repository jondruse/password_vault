# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_vault/version'

Gem::Specification.new do |spec|
  spec.name          = "password_vault"
  spec.version       = PasswordVault::VERSION
  spec.authors       = ["Jon Druse"]
  spec.email         = ["jon@jondruse.com"]
  spec.description   = %q{CLI Password Vault}
  spec.summary       = %q{CLI Password Vault}
  spec.homepage      = "https://github.com/jondruse/password_vault"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "commander"
  spec.add_dependency "terminal-table"
  spec.add_dependency "clipboard"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakefs"
end
