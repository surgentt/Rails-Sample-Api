require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    it 'has a valid factory' do
      order = FactoryGirl.create(:order)
      order = order.reload
      expect(order.address).to eq('101 Christie Street, New York, NY 10005')
    end

    it 'should NOT allow creation without a user_id, address, stripe token' do
      order = Order.create
      expect(order.errors.count).to eq(3)
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
      order.menu_items << MenuItem.all
      order.save
      expect(order.menu_items).to eq([menu_item])
    end

    it 'will not be able to save the has_many through if the order does NOT have an id' do
      order = FactoryGirl.build(:order)
      FactoryGirl.create(:menu_item)
      order.menu_items << MenuItem.all
      expect(order.save).to eq(false)
    end
  end

  describe '#create_by_customer(order_params, user)' do
    it 'sets all relevant attribuets' do
      menu_item1 = FactoryGirl.create(:menu_item)
      menu_item2 = FactoryGirl.create(:menu_item)
      user = FactoryGirl.create(:user)
      order = Order.new
      order_params = {address: '549 South Waterloo Road, Devon, PA 19333', stripe_card_token: 'fklsdjah', menu_items: [menu_item1.id, menu_item2.id]}
      order.create_by_customer(order_params, user)
      order = order.reload
      expect(order.user).to eq(user)
      expect(order.address).to eq('549 South Waterloo Road, Devon, PA 19333')
      expect(order.stripe_card_token).to eq('fklsdjah')
      expect(order.total_price_in_cents).to eq(200)
      expect(order.menu_items).to match_array([menu_item1, menu_item2])
    end

    it 'requires menu_items for an order', focus: true do
      user = FactoryGirl.create(:user)
      order = Order.new
      order_params = {address: '549 South Waterloo Road, Devon, PA 19333', stripe_card_token: 'fklsdjah', menu_items: []}
      order.create_by_customer(order_params, user)
      expect(order.persisted?).to eq(false)
      expect(order.errors.count).to eq(1)
    end
  end

end
