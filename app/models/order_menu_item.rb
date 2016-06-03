class OrderMenuItem < ActiveRecord::Base

  validates :order_id, presence: true
  validates :menu_item_id, presence: true

  belongs_to :order
  belongs_to :menu_item

end
