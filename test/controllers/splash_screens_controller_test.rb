require "test_helper"

class SplashScreensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @splash_screen = splash_screens(:one)
  end

  test "should get index" do
    get splash_screens_url
    assert_response :success
  end

  test "should get new" do
    get new_splash_screen_url
    assert_response :success
  end

  test "should create splash_screen" do
    assert_difference("SplashScreen.count") do
      post splash_screens_url, params: { splash_screen: {  } }
    end

    assert_redirected_to splash_screen_url(SplashScreen.last)
  end

  test "should show splash_screen" do
    get splash_screen_url(@splash_screen)
    assert_response :success
  end

  test "should get edit" do
    get edit_splash_screen_url(@splash_screen)
    assert_response :success
  end

  test "should update splash_screen" do
    patch splash_screen_url(@splash_screen), params: { splash_screen: {  } }
    assert_redirected_to splash_screen_url(@splash_screen)
  end

  test "should destroy splash_screen" do
    assert_difference("SplashScreen.count", -1) do
      delete splash_screen_url(@splash_screen)
    end

    assert_redirected_to splash_screens_url
  end
end
