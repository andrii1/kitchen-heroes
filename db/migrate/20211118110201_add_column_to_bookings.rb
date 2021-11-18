class AddColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date_booking, :date
  end
end
