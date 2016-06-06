require 'rails_helper'

RSpec.describe Api::V1::Users::RegistrationsController, type: :controller do

  describe 'POST auth' do

    it 'creates a user when one does NOT exist', focus: true do
      # @request.env['devise.mapping'] = Devise.mappings[:user]
      post :create, name: 'Thomas Surgent', email: 'surgentt@gmail.com', password: 'password123', password_confirmation: 'password123'
      expect(response).to be_success
      expect(User.count).to eq 1
      expect(User.first.email).to eq('surgentt@gmail.com')
    end

  end

end
