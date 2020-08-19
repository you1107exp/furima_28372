class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :seller_prefecture
  belongs_to_active_hash :days_until_shipping
  belongs_to :user
  has_one_attached :image
  
  validates :image, :name, :explanation, :category, :condition, :shipping_charge, :seller_prefecture, :days_until_shipping, :price, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :seller_prefecture_id, :days_until_shipping_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
