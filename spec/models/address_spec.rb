require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入機能' do
    it "配送先の住所情報も購入の都度入力させること" do
      expect(@address).to be_valid
    end
    it "郵便番号が必須であること" do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end
    it "都道府県が必須であること" do
      @address.prefecture_id = 1
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture id must be other than 1")
    end
    it "市区町村が必須であること" do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end
    it "番地が必須であること" do
      @address.address = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が必須であること" do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "郵便番号にはハイフンが必要であること" do
      @address.postal_code = "0000000"
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code is invalid")
    end
    it "電話番号にはハイフンは不要であること" do
      @address.phone_number = "090-1234-5678"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号は11桁以内であること" do
      @address.phone_number = "090123456789"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
