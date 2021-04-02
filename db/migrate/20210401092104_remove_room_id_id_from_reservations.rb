class RemoveRoomIdIdFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :room_id_id, :bigint
  end
end
