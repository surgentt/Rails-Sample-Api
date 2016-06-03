class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_menu_items
  has_many :menu_items, through: :order_menu_items

  validates :user_id, presence: true
  validates :address, presence: true
  validates :stripe_card_token, presence: true
  # validates :menu_items, presence: true
  # validates :total_price_in_cents, presence: true

  def create_by_customer(order_params, user)
    self.user=user
    self.attributes=order_params.except(:menu_items)
    self.save
    self.menu_items << get_menu_items(order_params[:menu_items])
    self.total_price_in_cents = total_fee_price
    charge_stripe
    self.save
  end

  private

  def get_menu_items(menu_item_ids)
    MenuItem.where(id: menu_item_ids)
  end

  def total_fee_price
    self.menu_items.inject(0){|sum, menu_item| sum + menu_item.price_in_cents}
  end

  def charge_stripe
    response = stripe_charge(self.stripe_card_token, self.total_price_in_cents)
    if response && response['status'] == 'succeeded'
      true
    else
      false
    end
  end

  def stripe_charge(token, total_amt_in_cents)
    #TODO: Talk to client about preferred credit card processing
    # Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    # begin
    #   Stripe::Charge.create(
    #     :amount => total_amt_in_cents,
    #     :currency => 'usd',
    #     :source => token,
    #     :description => 'Example charge'
    #   )
    # rescue Stripe::CardError => e
    #   # The card has been declined
    # end

    # TODO: Remove hardcoded stripe response when setup
    {'status' => 'succeeded'}
  end

end
