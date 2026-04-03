require "test_helper"
require_relative "../lib/confi"

class User
  include Confi
end

describe User do
  let(:symb) { :symbol }
  let(:hsh) { {"a" => 1, "b" => 2} }

  def setup
    @user = User.new
  end

  it "rake warning" do
    @user.a = symb
    assert_equal symb, @user.a

    @user.configure(hsh)
    assert_equal 1, @user.a
    assert_equal 2, @user.b
  end
end
