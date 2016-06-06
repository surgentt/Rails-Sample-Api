require 'rails_helper'

RSpec.describe Api::V1::Users::SessionsController, type: :controller do

  describe 'POST /api/v1/auth/sign_in' do

    it 'Logs in a user', focus: true do
      @request.env['devise.mapping'] = Devise.mappings[:api_v1_user]
      User.create!(name: 'Thomas Surgent', email: 'surgentt@gmail.com', password: 'password123')
      post :create, email: 'surgentt@gmail.com', password: 'password123'
      expect(response).to be_success
    end

  end

end
