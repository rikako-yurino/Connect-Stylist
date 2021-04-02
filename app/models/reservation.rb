class Reservation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :room  
  belongs_to_active_hash :time_zone
  belongs_to_active_hash :purpose
  belongs_to_active_hash :style
end
