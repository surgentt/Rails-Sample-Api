require 'rails_helper'

RSpec.describe MenuItem, type: :model do

  describe '#create' do
    it 'has a valid factory' do
      menu_item = FactoryGirl.create(:menu_item)
      menu_item = menu_item.reload
      expect(menu_item.title).to eq('Pasta')
      expect(menu_item.description.length).to be >(5)
      expect(menu_item.price_in_cents).to eq(100)
    end

    it 'should NOT allow creation with out a title, price, or description' do
      menu_item = MenuItem.create
      expect(menu_item.errors.count).to eq(3)
    end


    it 'had_many menu_items through order_menu_items' do
      order = FactoryGirl.create(:order)
      menu_item = FactoryGirl.create(:menu_item)
      menu_item.orders << order
      order.save
      expect(menu_item.orders).to eq([order])
    end
  end

end

