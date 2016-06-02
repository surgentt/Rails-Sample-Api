class Order < ActiveRecord::Base
  validates :user_id, presence: true
  validates :address, presence: true
  # validates :total_price_in_cents, presence: true
  # validates :stripe_card_token, presence: true

  belongs_to :user
end
