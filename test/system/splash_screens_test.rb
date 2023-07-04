require "application_system_test_case"

class SplashScreensTest < ApplicationSystemTestCase
  setup do
    @splash_screen = splash_screens(:one)
  end

  test "visiting the index" do
    visit splash_screens_url
    assert_selector "h1", text: "Splash screens"
  end

  test "should create splash screen" do
    visit splash_screens_url
    click_on "New splash screen"

    click_on "Create Splash screen"

    assert_text "Splash screen was successfully created"
    click_on "Back"
  end

  test "should update Splash screen" do
    visit splash_screen_url(@splash_screen)
    click_on "Edit this splash screen", match: :first

    click_on "Update Splash screen"

    assert_text "Splash screen was successfully updated"
    click_on "Back"
  end

  test "should destroy Splash screen" do
    visit splash_screen_url(@splash_screen)
    click_on "Destroy this splash screen", match: :first

    assert_text "Splash screen was successfully destroyed"
  end
end
