class RenameDateColumnToReservations < ActiveRecord::Migration[6.0]
  def change
    rename_column :reservations, :date, :reservation_date
  end
end
