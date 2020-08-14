class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :dob, presence: true
  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters"}
    validates :family_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters"}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters"}
  end
end
