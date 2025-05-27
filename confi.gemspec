# $LOAD_PATH.push File.expand_path("lib", __dir__)

VERSION = "0.1.1"

Gem::Specification.new do |s|
  s.name = "confi"
  s.version = VERSION
  s.summary = "Auto attr_accessor for a kind of configuration"
  s.description = s.summary

  s.authors = ["Dittmar Krall"]
  s.email = "dittmar.krall@gmail.com"
  s.homepage = "https://github.com/matique/confi"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.required_ruby_version = "~> 3"

  s.add_development_dependency "simplecov", ">= 0"
  s.add_development_dependency "standard", ">= 0"
end
