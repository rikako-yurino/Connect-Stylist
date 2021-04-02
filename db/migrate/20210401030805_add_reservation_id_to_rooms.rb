class AddReservationIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :reservation_id, :integer
  end
end
