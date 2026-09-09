if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    skip "/test/"
  end
end

require "minitest/autorun"
require "ricecream"
