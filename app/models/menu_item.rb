class MenuItem < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :price_in_cents, presence: true

  has_many :order_menu_items
  has_many :orders, through: :order_menu_items

end
