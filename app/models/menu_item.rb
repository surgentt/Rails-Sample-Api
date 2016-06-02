class MenuItem < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :price_in_cents, presence: true

end
