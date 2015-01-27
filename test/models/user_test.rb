require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without a password" do
    user = User.new
    user.email = "user@example.com"
    assert_not user.save, "Saved the user without a password"
  end

  test "should not save user without presnter? being set" do
    user = User.new
    user.email = "user@example.com"
    user.password = "abc"
    assert_not user.save, "Saved the user with presnter as nil"
  end
end
