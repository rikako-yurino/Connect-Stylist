class Reservation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :room  
  belongs_to_active_hash :time_zone
  belongs_to_active_hash :purpose
  belongs_to_active_hash :style

  # def date_before
  #   return if reservation_date.blank?
  #   errors.add(:reservation_date, "は明日以降を選択してください") if reservation_date < Date.today + 1
  # end
end
