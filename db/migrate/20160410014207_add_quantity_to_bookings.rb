class AddQuantityToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :quantity, :integer
  end
end
