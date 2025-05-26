require "test_helper"
require "yaml"
require_relative "../lib/confi"

class User
  include Confi
end

describe User do
  let(:int) { rand 1..10 }
  let(:symb) { :symbol }
  let(:hsh) { {"a" => 1, "b" => 2} }
  let(:user) { User.new }

  it "rejects uninitialized attribute" do
    assert_raises {
      user.unknown
    }
  end

  it "putter & getter" do
    user.a = symb
    assert_equal symb, user.a
  end

  it "configures with hash" do
    user.configure(hsh)

    assert_equal 1, user.a
    assert_equal 2, user.b
  end

  it "configures with block" do
    user.configure do |spec|
      spec.c = :c
    end

    assert_equal :c, user.c
  end

  it "configures with hash & block" do
    user.configure(hsh) do |spec|
      spec.c = :c
    end

    assert_equal 1, user.a
    assert_equal :c, user.c
  end

  it "configure independent instances" do
    user2 = User.new
    user.a = symb
    user2.a = int

    assert_equal symb, user.a
    assert_equal int, user2.a
    refute_equal user.a, user2.a
  end
end
