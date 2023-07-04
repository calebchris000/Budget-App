require "rails_helper"
require "devise"
RSpec.describe "Group", type: :feature do
  include Devise::Test::IntegrationHelpers
  describe "group" do
    before(:each) do
      @user = User.create(name: "Caleb Nwaizu", email: "calebchris000@gmail.com", password: 111_111)
      sign_in @user
      @group = Group.create(user: @user, name: "Vacation", icon: "icon.png")
      visit groups_path
    end

    it "renders the group name" do
      expect(page).to have_content(@group.name)
    end

    it "should have the date" do
      expect(page).to have_content(DateTime.parse(@group.created_at.to_s).strftime("%d-%m-%Y"))
    end
    it "should have the create button" do
      expect(page).to have_content("Create New Category")
    end
  end
end
