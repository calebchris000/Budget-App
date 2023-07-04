require "rails_helper"
require 'devise'

RSpec.describe GroupEntity, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: "Caleb", email: "caleb@mail.com", password: 111_111)
    sign_in @user
  end

  it "should belong to a group and a entity" do
    group = Group.create(name: "Travel", icon: "icon.png", user: @user)
    entity = Entity.create(name: "Huwaii", amount: 3302, user: @user )

    group_entity = GroupEntity.create(group: group, entity: entity)
    expect(group_entity).to be_valid
    expect(group_entity.group).to eq(group)
    expect(group_entity.entity).to eq(entity)
  end
end
