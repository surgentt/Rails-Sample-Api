# require 'rails_helper'
#
# RSpec.describe Api::V1::RegistrationsController, type: :controller do
#
#   describe 'POST /api/v1/auth' do
#
#     it 'creates a user when one does NOT exist' do
#       post '/api/v1/auth', name: 'Thomas Surgent', email: 'surgentt@gmail.com', password: 'password123', password_confirmation: 'password123'
#       binding.pry
#       expect(response).to be_success
#       expect(User.count).to eq 1
#       expect(User.first.email).to eq('surgentt@gmail.com')
#     end
#
#   end
#
# end
