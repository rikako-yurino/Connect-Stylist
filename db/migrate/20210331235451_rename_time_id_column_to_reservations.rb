class RenameTimeIdColumnToReservations < ActiveRecord::Migration[6.0]
  def change
    rename_column :reservations, :time_zone_id, :time_zone_id
  end
end
