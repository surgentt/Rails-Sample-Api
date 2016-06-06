require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do

  describe 'GET /api/v1/orders' do

    it 'returns all orders for the application' do
      user = FactoryGirl.create(:user)
      Order.create(user_id: user.id, address: '101 Chrisitie Street, New York, NY 10003', stripe_card_token: 'abx534')
      get :view_all
      expect(response).to be_success
    end

  end

end
