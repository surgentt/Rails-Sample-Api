require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    it 'has a valid factory' do
      order = FactoryGirl.create(:order)
      order = order.reload
      expect(order.address).to eq('101 Christie Street, New York, NY 10005')
    end

    it 'should NOT allow creation without a user_id, address' do
      order = Order.create
      expect(order.errors.count).to eq(2)
    end

    it 'Belongs to a User' do
      user = FactoryGirl.create(:user)
      order = FactoryGirl.create(:order)
      order.user = user
      order.save
      order = order.reload
      expect(order.user).to eq(user)
    end
  end
end
