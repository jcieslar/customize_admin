$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "customize_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "customize_admin"
  s.version     = CustomizeAdmin::VERSION
  s.authors     = ["Jakub Cieslar"]
  s.email       = ["cieslar.jakub@gmail.com"]
  s.homepage    = "https://github.com/JCieslar/customize_admin"
  s.summary     = "CustomizeAdmin it is simple way to customize your admin view."
  s.description = "CustomizeAdmin it is simple way to customize your admin view."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency 'inherited_resources'
  s.add_dependency 'has_scope'
  s.add_dependency 'formtastic'
  s.add_dependency 'will_paginate'
  s.add_dependency 'devise'
  s.add_dependency 'twitter-bootstrap-rails', '1.4.3'
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "pg"
end
