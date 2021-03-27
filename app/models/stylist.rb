class Stylist < ApplicationRecord
  has_many :rooms
  has_many :messages, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do  
  validates :email
  validates :license
  validates :profile
  end
  with_options format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は半角英数字を含んでください"} do
    validates :password
    validates :encrypted_password
  end
end
