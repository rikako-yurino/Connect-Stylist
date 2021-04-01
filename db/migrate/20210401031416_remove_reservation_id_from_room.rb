class RemoveReservationIdFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :reservation_id, :integer
  end
end
