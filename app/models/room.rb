class Room < ApplicationRecord
  belongs_to :user
  belongs_to :stylist, optional: true
  belongs_to :reservation
  has_many :messages, dependent: :destroy
end
