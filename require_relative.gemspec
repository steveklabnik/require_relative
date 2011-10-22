# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "require_relative/version"

Gem::Specification.new do |s|
  s.name        = "require_relative"
  s.version     = RequireRelative::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steve Klabnik", "Brendan Taylor"]
  s.email       = ["steve@steveklabnik.com", "whateley@gmail.com"]
  s.homepage    = "http://steveklabnik.github.com/require_relative"
  s.summary     = %q{This backports require_relative to Ruby 1.8.}
  s.description = %q{In Ruby 1.9.2, "." was removed from $:. This is a good idea, for security reasons. This gem backports this to Ruby 1.8.}

  s.add_development_dependency "minitest"
  s.add_development_dependency "rocco"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
