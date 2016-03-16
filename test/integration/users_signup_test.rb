require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "不正な登録があった場合" do
 	  get signup_path
 	  assert_no_difference 'User.count' do
 	  	post users_path, user: {email: "user@invalid", password: "foo", password_confirmation: "bar"}
 	  end
 	  assert_template 'users/new'
  end

  test "正当な登録があった場合" do
  	get signup_path
  	assert_difference "User.count", 1 do
  		post_via_redirect users_path, user:{email: "example@user.com", password: "foobar", password_confirmation: "foobar"}
    end
    assert_template 'users/show'
  end

end
