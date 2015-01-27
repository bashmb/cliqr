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

  test "should save the user" do
    user = User.new
    user.email = "user@example.com"
    user.password = "abc"
    user.presenter = false
    assert user.save, "Saved the user"
  end

  test "should not save two users with the same email" do
    user1 = User.new
    user1.email = "user@example.com"
    user1.password = "abc"
    user1.presenter = false
    user1.save

    user2 = User.new
    user2.email = "user@example.com"
    user2.password = "abc"
    user2.presenter = false
    assert_not user2.save, "Saved user with a duplicate email"
  end
end
