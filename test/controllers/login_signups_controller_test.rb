require "test_helper"

class LoginSignupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @login_signup = login_signups(:one)
  end

  test "should get index" do
    get login_signups_url
    assert_response :success
  end

  test "should get new" do
    get new_login_signup_url
    assert_response :success
  end

  test "should create login_signup" do
    assert_difference("LoginSignup.count") do
      post login_signups_url, params: { login_signup: {  } }
    end

    assert_redirected_to login_signup_url(LoginSignup.last)
  end

  test "should show login_signup" do
    get login_signup_url(@login_signup)
    assert_response :success
  end

  test "should get edit" do
    get edit_login_signup_url(@login_signup)
    assert_response :success
  end

  test "should update login_signup" do
    patch login_signup_url(@login_signup), params: { login_signup: {  } }
    assert_redirected_to login_signup_url(@login_signup)
  end

  test "should destroy login_signup" do
    assert_difference("LoginSignup.count", -1) do
      delete login_signup_url(@login_signup)
    end

    assert_redirected_to login_signups_url
  end
end
