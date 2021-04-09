class RemoveDetailsFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :purpose_id, :integer
    remove_column :rooms, :style_id, :integer
    remove_column :rooms, :remarks, :text
  end
end
