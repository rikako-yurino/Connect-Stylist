class Stylist < ApplicationRecord
  has_many :rooms
  has_many :messages, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :stylist_photo
  with_options presence: true do  
    validates :stylist_photo, presence: { message: 'を選択してください' }
    validates :email
    validates :license
    validates :profile
      with_options format:{with:/\A[ぁ-んァ-ン一-龥々]+\z/, message: "を全角で入力してください"} do  
        validates :last_name
        validates :first_name
      end
    end
  with_options format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は半角英数字を含んでください"} do
    validates :password
    validates :encrypted_password
  end
end
