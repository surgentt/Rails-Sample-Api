FactoryGirl.define do
  factory :order do
    user_id 1
    address '101 Christie Street, New York, NY 10005'
    total_price_in_cents 1
    stripe_card_token 'MyStripeString'
  end
end
