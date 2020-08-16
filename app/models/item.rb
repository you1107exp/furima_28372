class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :seller_prefecture_id, :days_until_shipping_id, :price, presence: true
end
