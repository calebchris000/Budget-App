require "rails_helper"
require 'devise'

RSpec.describe Group, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: "Caleb", email: "caleb@mail.com", password: 111_111)
    sign_in @user
  end

  it "should have many entities through group_entities" do
    group = Group.create(name: "Group 1", icon: "icon.png", user_id: @user.id)
    entity1 = Entity.create(name: "Entity 1", amount: 42, user: @user)
    entity2 = Entity.create(name: "Entity 2", amount: 21, user: @user)
    GroupEntity.create(group: group, entity: entity1)
    GroupEntity.create(group: group, entity: entity2)
    
    expect(group.entities).to include(entity1, entity2)
  end

  it "should not allow null user_id" do
    group = Group.new(name: "Group 1", icon: "icon.png")
    expect(group).not_to be_valid
    expect(group.errors[:user_id]).to eq([])
  end

  it "should throw error when adding name and icon without user_id" do
    group = Group.new(name: "Group 1", icon: "icon.png")
    expect { group.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
  end

  it "should create a group successfully with user_id, name, and icon" do
    group = Group.new(name: "Group 1", icon: "icon.png", user_id: @user.id)
    expect(group).to be_valid
    expect { group.save! }.not_to raise_error
  end
end
