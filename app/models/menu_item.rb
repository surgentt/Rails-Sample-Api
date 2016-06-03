class MenuItem < ActiveRecord::Base
  has_many :order_menu_items
  has_many :orders, through: :order_menu_items

  validates :title, presence: true
  validates :description, presence: true
  validates :price_in_cents, presence: true

end
