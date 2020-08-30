class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchases
  
  with_options presence: true do
    validates :nickname, :dob

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX, message: "Email Include @" }

    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX}

    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :family_name, format: { with: VALID_NAME_REGEX, message: "Family name Full-width characters" }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: "First name Full-width characters" }

    VALID_READING_REGEX = /\A[ァ-ヶー－]+\z/
    validates :family_name_reading, format: { with: VALID_READING_REGEX, message: "Family name reading Full-width katakana characters" }
    validates :first_name_reading, format: { with: VALID_READING_REGEX, message: "First name reading Full-width katakana characters" }
  end
end
