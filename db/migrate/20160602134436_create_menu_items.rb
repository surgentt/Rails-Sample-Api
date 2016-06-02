class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.text :description
      t.integer :price_in_cents

      t.timestamps null: false
    end
  end
end
