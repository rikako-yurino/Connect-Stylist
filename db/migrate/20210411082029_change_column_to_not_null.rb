class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :reservation_date, :date, null: false
    change_column :reservations, :purpose_id, :integer, null: false
    change_column :reservations, :style_id,:integer, null: false
  end
end
