class AddDetailsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :purpose_id, :integer
    add_column :reservations, :style_id, :integer
    add_column :reservations, :remarks, :text
  end
end
