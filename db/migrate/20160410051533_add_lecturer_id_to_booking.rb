class AddLecturerIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :lecturer_id, :integer
  end
end
