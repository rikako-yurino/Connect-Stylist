class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date          :date,       null: false
      t.integer       :time_zone_id,    null: false
      t.references    :user,       foreign_key: true
      t.integer       :purpose_id
      t.integer       :style_id
      t.text          :remarks
      t.timestamps
    end
  end
end
