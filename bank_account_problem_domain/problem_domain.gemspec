Gem::Specification.new do |s|
  s.name        = 'bank_account_problem_domain'
  s.version     = '0.0.0'
  s.date        = '2017-01-09'
  s.summary     = "problem domain objects implementation"
  s.description = "This library contains the implementation of problem domain objects for the bank account system."
  s.authors     = ["Humberto Marchezi"]
  s.email       = 'hcmarchezi@gmail.com'
  s.files       =  Dir.glob('lib/**').reject { |file_path| File.directory? file_path } #["lib/problem_domain.rb"]
  s.homepage    = 'http://private'
  s.license     = 'MIT'
  s.add_runtime_dependency 'activerecord', '5.0.1'
  s.add_runtime_dependency 'rspec', '3.5.0'
end
