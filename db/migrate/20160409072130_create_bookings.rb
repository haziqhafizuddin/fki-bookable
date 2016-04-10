class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :equipment_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
