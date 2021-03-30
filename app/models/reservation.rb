class Reservation < ApplicationRecord
  belongs_to  :user
  has_one     :room

  with_options presence: true do  
    validates :date
    validates :time_id, numericality: { other_than: 1, message: "を選んでください" }
  end
end
