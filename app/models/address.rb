class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :purchase

  # バリデーションをapp/forms/purchase_address.rbへ移動
  # with_options presence: true do
  #   validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  #   validates :prefecture, :city, :address
  #   validates :phone_number, format: { with: /\A\d{10,11}\z/}
  # end
  # validates :prefecture_id, numericality: { other_than: 1 }
end
