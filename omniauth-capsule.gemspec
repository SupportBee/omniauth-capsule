# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-capsule/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Pranav Singh"]
  gem.email         = ["pranav@supportbee.com"]
  gem.description   = %q{OmniAuth strategy for Capsule CRM.}
  gem.summary       = %q{OmniAuth strategy for Capsule CRM.}
  gem.homepage      = "https://github.com/SupportBee/omniauth-capsule"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.name          = "omniauth-capsule"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Capsule::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'

  gem.add_development_dependency "bundler", "~> 1.0"
end
