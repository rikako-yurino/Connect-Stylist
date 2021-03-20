class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer       :purpose_id,     null: false
      t.integer       :style_id,       null: false
      t.text          :remarks
      t.references    :user,           foreign_key: true, opitinal: true
      t.references    :stylist,        foreign_key: true, opitinal: true
      t.timestamps
    end
  end
end
