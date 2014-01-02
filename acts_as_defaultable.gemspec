$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_defaultable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_defaultable"
  s.version     = ActsAsDefaultable::VERSION
  s.authors     = ["Giorgos Tsiftsis"]
  s.email       = ["giorgos.tsiftsis@gmail.com"]
  s.homepage    = "https://github.com/chief/acts_as_defaultable"
  s.summary     = "A gem allowing an active_record model to be default(unique) based on a specified column"
  s.description = "This 'acts_as' extension provides the capability for having a default object. The class that has this specified needs to have a default column defined as an integer, string or boolean on the mapped database table"

  # Load Paths...
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  #s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'activesupport', ['>= 3.0.0']
  s.add_dependency 'activerecord',  ['>= 3.0.0']

  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'rails', ['= 3.2.16']
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'guard-rspec'
end
