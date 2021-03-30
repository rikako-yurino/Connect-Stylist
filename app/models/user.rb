class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :room
  has_many :messages, dependent: :destroy
  belongs_to :prefecture
  belongs_to :work
  belongs_to :frame_type
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :user_photo
       
  with_options presence: true do  
    validates :email
    validates :birthday
    validates :nickname
    with_options format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は半角英数字を含んでください"} do
      validates :password
      validates :encrypted_password
    end
    with_options format:{with:/\A[ぁ-んァ-ン一-龥々]+\z/, message: "を全角で入力してください"} do  
      validates :last_name
      validates :first_name
    end
    with_options format:{with: /\A[ァ-ヶー－]+\z/, message: "を全角カタカナで入力してください"} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
  with_options numericality: { other_than: 1, message: "を選んでください" } do
    validates :prefecture_id
    validates :work_id
    validates :frame_type_id
  end
end
