require "test_helper"
require_relative "../lib/confi"

describe Confi do
  let(:int) { 123 }
  let(:list) { [1, 2, 3] }
  let(:hsh) { { "a"=>1, "b"=>2, "c"=>3 } }
  let(:symb) { :symbol }

  it "putter & getter" do
    Confi.a = symb
    assert_equal symb, Confi.a
    Confi.a = int
    assert_equal int, Confi.a
  end

  it "configures with hash" do
    Confi.configure(hsh)
    check hsh
  end

  it "configures with block" do
    Confi.configure do |m|
      m.aa = int
      m.bb = list
    end
    assert_equal int, Confi.aa
    assert_equal list, Confi.bb
  end

  it "dumps (private method)" do
    Confi.configure(hsh)
    res = Confi.send(:dump)
    check hsh
  end

  it "round trip with a YAML file" do
    Tempfile.create do |f|
      f.puts YAML.dump(hsh)
      f.rewind
      Confi.configure(YAML.load(f.read))
      check hsh
    end
  end

  private

  def check(hsh)
    hsh.each { |key, value|
      assert_equal hsh[key], Confi.send(key)
    }
  end
end
