# For development purposes; do not waste your tine reading it!

require "test_helper"
require_relative "../lib/confi"
require "benchmark"
require "benchmark/ips"
# ENV["MORE"] = "true"

class User
  include Confi
end

describe "ConfigWe timings" do
  it "times ips" do
    return unless ENV["MORE"]

    p "********************** Confi timings"
    hsh = {"a" => 1, "b" => 2, :hugo => 3}
    user = User.new
    user.configure(hsh)

    Benchmark.ips do |x|
      x.report("** (empty)") {}
      x.report("hsh: ") { hsh }
      x.report("hsh[:hugo]: ") { hsh[:hugo] }
      x.report("hsh[:hugo] = true: ") { hsh[:hugo] = true }
      x.report("hsh[\"b\"]: ") { hsh["b"] }
      x.report("hsh[\"b\"] = 3: ") { hsh["b"] = 3 }

      x.report("** Confi (empty)") {}
      # x.report("Confi.b: ") { Confi.b } # expected fail
      x.report("Confi.hugo = true: ") { Confi.hugo = true }
      x.report("Confi.hugo: ") { Confi.hugo }
      # x.report("Confi.a: ") { Confi.a } # expected fail

      x.report("** User (empty)") {}
      x.report("user: ") { user }
      # x.report("user.unknown: ") { user.unknown } # expected fail
      x.report("user.hugo = true: ") { user.hugo = true }
      x.report("user.hugo: ") { user.hugo }

      x.compare!
    end
  end
end
