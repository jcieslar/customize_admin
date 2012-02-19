$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "customize_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "customize_admin"
  s.version     = CustomizeAdmin::VERSION
  s.authors     = ["Jakub Cieslar"]
  s.email       = ["cieslar.jakub@gmail.com"]
  s.homepage    = ""
  s.summary     = "CustomizeAdmin."
  s.description = "CustomizeAdmin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "pg"
end
