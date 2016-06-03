require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    it 'has a valid factory' do
      order = FactoryGirl.create(:order)
      order = order.reload
      expect(order.address).to eq('101 Christie Street, New York, NY 10005')
    end

    it 'should NOT allow creation without a user_id, address, total_price_in_cents and stripe token' do
      order = Order.create
      expect(order.errors.count).to eq(4)
    end

    it 'belongs_to a User' do
      user = FactoryGirl.create(:user)
      order = FactoryGirl.create(:order)
      order.user = user
      order.save
      order = order.reload
      expect(order.user).to eq(user)
    end

    it 'had_many menu_items through order_menu_items' do
      order = FactoryGirl.create(:order)
      menu_item = FactoryGirl.create(:menu_item)
      order.menu_items << menu_item
      order.save
      expect(order.menu_items).to eq([menu_item])
    end
  end
end
