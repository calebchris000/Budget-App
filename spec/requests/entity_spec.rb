require "rails_helper"

RSpec.describe "Groups", type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: "Caleb Nwaizu", email: "calebchris000@gmail.com", password: 111_111)
    sign_in @user
  end

  describe "GET /index" do
    it "returns success on visit" do
      @group = Group.create(name: "Huwaii", icon: "icon.png", user: @user)
      get group_entities_path(group_id: @group.id)
      expect(response).to be_successful
    end
  end

  describe "POST /entities" do
    it "creates a new entity" do
      @group = Group.create(name: "Huwaii", icon: "icon.png", user: @user)
      entity_params = { entity: { name: "New Entity", amount: 300, user_id: @user.id } }

      expect {
        post group_entities_path(group_id: @group.id), params: entity_params
      }.to change(Entity, :count).by(1)

      expect(response).to redirect_to(group_entities_path(group_id: @group.id))
    end
  end

  describe "GET /groups/new" do
    it "returns success when visiting the new group form" do
      get new_group_path
      expect(response).to be_successful
    end
  end
end
