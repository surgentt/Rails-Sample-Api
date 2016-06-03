require 'rails_helper'

RSpec.describe OrderMenuItem, type: :model do

  describe '#create' do
    it 'has a valid factory' do
      order_menu_item = FactoryGirl.create(:order_menu_item)
      order_menu_item = order_menu_item.reload
      expect(order_menu_item.order_id).to eq(1)
      expect(order_menu_item.menu_item_id).to eq(1)
    end
  end
end
