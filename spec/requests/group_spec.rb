require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Caleb Nwaizu', email: 'calebchris000@gmail.com', password: 111_111)
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns success on visit' do
      get groups_path
      expect(response).to be_successful
    end
  end

  describe 'POST /groups' do
    it 'creates a new group' do
      group_params = { group: { name: 'New Group', user_id: @user.id } }

      expect do
        post groups_path, params: group_params
      end.to change(Group, :count).by(1)

      expect(response).to redirect_to(groups_path)
    end
  end

  describe 'GET /groups/new' do
    it 'returns success when visiting the new group form' do
      get new_group_path
      expect(response).to be_successful
    end
  end
end
