class RenameDeadlineToTakenAtInBookings < ActiveRecord::Migration[7.2]
  def change
    rename_column :bookings, :deadline, :taken_at
  end
end
