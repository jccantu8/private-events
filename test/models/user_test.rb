require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "John")
  end

  test "initial username should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = 'a' * 16
    assert_not @user.valid?
  end

  test "username should only include letters and numbers" do
    @user.username = "abcdefg23456"
    assert @user.valid?
  end

  test "username should not only include special characters" do
    @user.username = "John@*-/"
    assert_not @user.valid?
  end
end
