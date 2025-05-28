# Confi

[![Gem Version](https://badge.fury.io/rb/confi.svg)](http://badge.fury.io/rb/confi)
[![GEM Downloads](https://img.shields.io/gem/dt/confi?color=168AFE&logo=ruby&logoColor=FE1616)](https://rubygems.org/gems/confi)
[![rake](https://github.com/matique/confi/actions/workflows/rake.yml/badge.svg)](https://github.com/matique/confi/actions/workflows/rake.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/standardrb/standard)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](http://choosealicense.com/licenses/mit/)

A simple and efficient "configuration" gem for Ruby
(can be used in Rails as well).
Options can be initialized as required and later be accessed.

A global *Confi* (the usual usage)
as well as an instance (not recommended) configuration
are supported.

See *Usage* below.


## Installation

~~~~ruby
# Gemfile
...
gem "confi"
...
~~~~

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


## Miscellaneous

Copyright (c) 2025 Dittmar Krall (www.matiq.com),
released under the [MIT license](https://opensource.org/licenses/MIT).
