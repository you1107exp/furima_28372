class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture, :city, :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    # user = User.create
    # item = Item.create
    purchase = Purchase.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end