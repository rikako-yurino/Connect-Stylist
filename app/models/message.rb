class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stylist, optional: true
  belongs_to :room

  validates :message, presence: true
end
