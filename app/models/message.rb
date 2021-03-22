class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stylist, optional: true
  belongs_to :room

  validates :content, presence: true
end
