class Stylist < ApplicationRecord
  has_one :room
  has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do  
  validates :email
  validates :license
  validates :profile
  with_options format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は半角英数字を含んでください"} do
    validates :password
    validates :encrypted_password
  end
end
