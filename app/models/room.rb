class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  with_options presence: true do  
    validates :purpose_id
    validates :style_id
  end
  validates :remarks, length: { maximum: 140}
end
