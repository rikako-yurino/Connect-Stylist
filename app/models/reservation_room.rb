class ReservationRoom
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :date, :time_zone_id, :user_id, :purpose_id, :style_id, :remarks, :stylist_id, :user_id, :reservation_id

  with_options presence: true do
    validates :date
    with_options numericality: { other_than: 1, message: "Select"}  do
      validates :time_zone_id
      validates :purpose_id
      validates :style_id
    end
  end
  validates :remarks, length: { maximum: 140}


  def save
    reservation = Reservation.create(date: date, time_zone_id: time_zone_id, user_id: user_id, purpose_id: purpose_id, style_id: style_id, remarks: remarks)
    Room.create(user_id: user_id, reservation_id: reservation.id)
  end
end