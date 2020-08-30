class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }

    validates :city, :address
    
    PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
