require "rails_helper"
require "devise"
RSpec.describe "Entity", type: :feature do
  include Devise::Test::IntegrationHelpers
  describe "entity" do
    before(:each) do
      @user = User.create(name: "Caleb Nwaizu", email: "calebchris000@gmail.com", password: 111_111)
      sign_in @user
      @group = Group.create(user: @user, name: "Vacation", icon: "icon.png")
      @entity = Entity.create(user: @user, name: "Huwaii", amount: 2020)
      @group_entity = GroupEntity.create(group: @group, entity: @entity)
      visit group_entities_path(group_id: @group.id)
    end

    it "renders the entity name" do
      expect(page).to have_content(@group.name)
    end

    it "should have the entity name" do
      expect(page).to have_content(@entity.name)
    end
    it "should have the create button" do
      expect(page).to have_content("Create New Entity")
    end
  end
end
