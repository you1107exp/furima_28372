require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができるとき' do
    it "ログインユーザーだけが出品ページへ遷移できること" do
      expect(@item).to be_valid
    end
    it "画像は1枚必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank") 
    end
    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態についての情報が必須であること" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it "発送元の地域についての情報が必須であること" do
      @item.seller_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Seller prefecture must be other than 1")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.days_until_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days until shipping must be other than 1")
    end
    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end
    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
  end
end
