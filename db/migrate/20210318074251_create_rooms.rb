class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer       :purpose_id,     null: false
      t.text          :remarks
      t.timestamps
    end
  end
end
