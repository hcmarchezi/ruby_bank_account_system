$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "domain_problem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "domain_problem"
  s.version     = DomainProblem::VERSION
  s.authors     = ["Humberto Marchezi"]
  s.email       = ["hcmarchezi@gmail.com"]
  s.homepage    = ""
  s.summary     = "Rails plugin for bank account domain objects."
  s.description = "Contains all entities related to the bank account system such that it can be reused to other systems."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
end
