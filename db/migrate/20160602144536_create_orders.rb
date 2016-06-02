class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.text :address
      t.integer :total_price_in_cents
      t.string :stripe_card_token

      t.timestamps null: false
    end
    add_index :orders, :user_id
  end
end
