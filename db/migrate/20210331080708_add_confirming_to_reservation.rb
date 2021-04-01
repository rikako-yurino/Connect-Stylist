class AddConfirmingToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :confirming, :integer, null: false
  end
end
