require "rails_helper"

RSpec.describe Entity, type: :model do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create(name: "Caleb", email: "caleb@mail.com", password: 111_111)
    sign_in @user
  end

  it "should have many groups through groups_entities" do
    entity = Entity.create(name: "Huwaii", amount: 23, user: @user)
    group1 = Group.create(name: "Vacation", icon: "icon.png", user: @user)
    group2 = Group.create(name: "Travel", icon: "travel.png", user: @user)
    GroupEntity.create(entity: entity, group: group1)
    GroupEntity.create(entity: entity, group: group2)
    expect(entity.groups).to include(group1, group2)
  end

  it "should not allpow null user_id" do
    entity = Entity.new(name: "Vacation", amount: 12)
    expect(entity).not_to be_valid
    expect(entity.errors[:user_id]).to eq([])
  end

  it 'should greate an entity successfully' do
  entity = Entity.new(name: 'Amsterdam', amount: 3300, user: @user)
  expect(entity).to be_valid
  expect {entity.save!}.not_to raise_error
  end
end
