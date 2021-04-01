class RemoveConfirmingFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :confirming, :integer
  end
end
