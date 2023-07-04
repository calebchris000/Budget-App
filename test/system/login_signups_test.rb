require "application_system_test_case"

class LoginSignupsTest < ApplicationSystemTestCase
  setup do
    @login_signup = login_signups(:one)
  end

  test "visiting the index" do
    visit login_signups_url
    assert_selector "h1", text: "Login signups"
  end

  test "should create login signup" do
    visit login_signups_url
    click_on "New login signup"

    click_on "Create Login signup"

    assert_text "Login signup was successfully created"
    click_on "Back"
  end

  test "should update Login signup" do
    visit login_signup_url(@login_signup)
    click_on "Edit this login signup", match: :first

    click_on "Update Login signup"

    assert_text "Login signup was successfully updated"
    click_on "Back"
  end

  test "should destroy Login signup" do
    visit login_signup_url(@login_signup)
    click_on "Destroy this login signup", match: :first

    assert_text "Login signup was successfully destroyed"
  end
end
