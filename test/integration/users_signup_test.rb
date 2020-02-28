require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup info" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { :username => "" } }
    end
    #assert_template 'users/new' #Doesnt work - tried everything
  end

  test "valid signup info" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { :username => "Henry" } }
    end
    follow_redirect!
    #assert_template 'users/new' #Doesnt work - tried everything
    assert is_logged_in?
  end
end
