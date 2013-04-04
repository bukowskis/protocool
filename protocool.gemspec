require File.expand_path('../lib/protocool/version', __FILE__)

Gem::Specification.new do |spec|

  spec.authors      = %w{ bukowskis }
  spec.summary      = "Decides whether to use TLS encryption or not on a per-environment basis in Rails."
  spec.description  = "Decides whether to use TLS encryption or not on a per-environment basis in Rails. Usually people don't have SSL on their local development machines, this gem makes it a configuration less no-brainer to enforce SSL everywhere else."
  spec.homepage     = 'https://github.com/bukowskis/protocool'
  spec.license      = 'MIT'

  spec.name         = 'protocool'
  spec.version      = Protocool::VERSION::STRING

  spec.files        = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  spec.require_path = 'lib'

  spec.rdoc_options.concat ['--encoding',  'UTF-8']

  spec.add_development_dependency('rspec')
  spec.add_development_dependency('guard-rspec')
  spec.add_development_dependency('rb-fsevent')

end
