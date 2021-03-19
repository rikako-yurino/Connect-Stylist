class Room < ApplicationRecord
  # has_many :messages, dependent: :destroy
  # belongs_to :users

  with_options presence: true do
    validates :purpose_id
    validates :style_id
  end
  validates :remarks, length: { maximum: 140}
end
