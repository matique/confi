# Confi

[![Gem Version](https://img.shields.io/gem/v/confi?color=168AFE&logo=rubygems&logoColor=FE1616)](https://rubygems.org/gems/confi)
[![Downloads](https://img.shields.io/gem/dt/confi?color=168AFE&logo=rubygems&logoColor=FE1616)](https://rubygems.org/gems/confi)
[![GitHub Build](https://img.shields.io/github/actions/workflow/status/matique/confi/rake.yml?logo=github)](https://github.com/matique/confi/actions/workflows/rake.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-168AFE.svg)](https://github.com/standardrb/standard)
[![MIT License](https://img.shields.io/badge/license-MIT-168AFE.svg)](http://choosealicense.com/licenses/mit/)

A simple and efficient "configuration" gem for Ruby
(can be used in Rails as well).
Options can be initialized as required and later be accessed.

A global *Confi* (the usual usage)
as well as an instance (not recommended) configuration
are supported.

See *Usage* below.


## Usage (global Confi)

~~~~ruby
require "confi"
...
Confi.debug = true
...
if Confi.debug
  ...
end
...
~~~~


## Configure (initialization)

~~~~ruby
Confi.configure(hash)
~~~~

~~~~ruby
Confi.configure do |s|
  s.option = :active
  s.name = "name"
end
~~~~


## Usage (in instances)

~~~~ruby
require "confi"

class User # a sample
  include Confi
end
...
# create instance
user = User.new

# Functionality same as with Confi; use instance name
user.debug = false
...
~~~~

~~~~ruby
...
# Not yet initialized attribute
if Confi.debug  # NoMethodError: undefined method 'debug'
  ...
end
...
~~~~


## Installation

As usual:

~~~~ruby
# Gemfile
...
gem "confi"
...
~~~~

and run "bundle install".


## Miscellaneous

Copyright (c) 2025 Dittmar Krall (www.matiq.com),
released under the [MIT license](https://opensource.org/licenses/MIT).
