class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_charge_id
      t.integer :seller_prefecture_id
      t.integer :days_until_shipping_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
