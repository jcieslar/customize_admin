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
  s.add_dependency 'inherited_resources', '1.3.0'
  s.add_dependency 'has_scope', '0.5.1'
  s.add_dependency 'formtastic', '2.0.2'
  s.add_dependency 'will_paginate', '3.0.2'
  s.add_dependency 'devise', '2.0.0'
  s.add_dependency 'twitter-bootstrap-rails', '1.4.3'
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "pg"
end
