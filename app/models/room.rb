class Room < ApplicationRecord
  belongs_to :reservation, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :stylist, optional: true
  has_many :messages, dependent: :destroy
end
