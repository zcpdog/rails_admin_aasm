# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_aasm/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_admin_aasm"
  spec.version       = RailsAdminAasm::VERSION
  spec.authors       = ["Chuanpin Zhu"]
  spec.email         = ["zcppku@gmail.com"]
  spec.description   = %q{Manage model's state with AASM and rails_admin}
  spec.summary       = %q{Integrate aasm with rails_admin, add a new type into rails_admin, which is state}
  spec.homepage      = "https://github.com/zcpdog/rails_admin_aasm"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails_admin'
  spec.add_dependency 'aasm'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
