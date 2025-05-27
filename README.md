# Confi

[![Gem Version](https://badge.fury.io/rb/confi.svg)](http://badge.fury.io/rb/confi)
[![GEM Downloads](https://img.shields.io/gem/dt/confi?color=168AFE&logo=ruby&logoColor=FE1616)](https://rubygems.org/gems/confi)
[![rake](https://github.com/matique/confi/actions/workflows/rake.yml/badge.svg)](https://github.com/matique/confi/actions/workflows/rake.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/standardrb/standard)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](http://choosealicense.com/licenses/mit/)

UNDER CONSTRUCTION

Executes good old shell/bash scripts locally as well as remotely.
The environment is set by a ".yml" configuration file.
An array environment variable triggers multiple calls of the script.

## Installation

  gem install confi


## Usage

    we ... [options]
    we hello.rb

## Options

    -l, --[no-]list          Lists available scripts
    -r, --remote ["host"]    remote host or comma separated hosts
    -e, --[no-]each          Lists each remote command (no execution)
    -s, --[no-]silent        run silently; suppress output
    -v, --[no-]verbose       Enable verbose output
    -n, --[no-]noop          Suppress execution of commannds
    -h, --help               Show this message
    -V, --version            Print version



## Miscellaneous

Copyright (c) 2025 Dittmar Krall (www.matiq.com),
released under the [MIT license](https://opensource.org/licenses/MIT).
