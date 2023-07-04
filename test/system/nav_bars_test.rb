require "application_system_test_case"

class NavBarsTest < ApplicationSystemTestCase
  setup do
    @nav_bar = nav_bars(:one)
  end

  test "visiting the index" do
    visit nav_bars_url
    assert_selector "h1", text: "Nav bars"
  end

  test "should create nav bar" do
    visit nav_bars_url
    click_on "New nav bar"

    click_on "Create Nav bar"

    assert_text "Nav bar was successfully created"
    click_on "Back"
  end

  test "should update Nav bar" do
    visit nav_bar_url(@nav_bar)
    click_on "Edit this nav bar", match: :first

    click_on "Update Nav bar"

    assert_text "Nav bar was successfully updated"
    click_on "Back"
  end

  test "should destroy Nav bar" do
    visit nav_bar_url(@nav_bar)
    click_on "Destroy this nav bar", match: :first

    assert_text "Nav bar was successfully destroyed"
  end
end
