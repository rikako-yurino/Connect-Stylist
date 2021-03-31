class ReservationRoom
  include ActiveModel::Model
  attr_accessor :date, :time_id, :user_id, :purpose_id, :style_id, :remarks, :stylist

  with_options presence: true do
    validates :date
    validates :time_id
    validates :user_id
    validates :purpose_id
    validates :style_id
  end
  validates :remarks, length: { maximum: 140}


  def save
    reservation = Reservation.create(date: date, time_id: time_id, user_id: user_id, purpose_id: purpose_id, style_id: style_id, remarks: remarks)
    Room.create(user_id: user_id, stylist_id: stylist_id)
  end
end