class Room < ApplicationRecord
  belongs_to :user
  belongs_to :stylist, optional: true
  has_many :messages, dependent: :destroy

  with_options presence: true do
    validates :purpose_id
    validates :style_id
  end
  validates :remarks, length: { maximum: 140}
end
