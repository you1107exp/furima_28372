require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報' do
    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは＠を含む必要があること" do
      @user.email = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Email Email Include @")
    end
    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは6文字以上であること" do
      @user.password = "1a2b3"
      @user.password_confirmation = "1a2b3"
      expect(@user.errors.full_messages).to include()
    end
    it "パスワードは半角英数字混合であること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user.errors.full_messages).to include()
    end
    it "パスワードは確認用も含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報確認' do
    it "ユーザー本名の名字が必須であること" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名の名前が必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.family_name = "Smith"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name Family name Full-width characters")
    end
    it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = "John"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name First name Full-width characters")
    end
    it "ユーザー本名の名字のフリガナが必須であること" do
      @user.family_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank", "Family name reading Family name reading Full-width katakana characters")
    end
    it "ユーザー本名の名前のフリガナが必須であること" do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank", "First name reading First name reading Full-width katakana characters")
    end
    it "ユーザー本名の名字のフリガナは全角（カタカナ）で入力させること" do
      @user.family_name_reading = "Smith"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading Family name reading Full-width katakana characters")
    end
    it "ユーザー本名の名前のフリガナは全角（カタカナ）で入力させること" do
      @user.first_name_reading = "John"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading First name reading Full-width katakana characters")
    end
    it "生年月日が必須であること" do
      @user.dob = "--"
      @user.valid?
      expect(@user.errors.full_messages).to include("Dob can't be blank")
    end
  end
end
