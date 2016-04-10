class AddCourseToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :course, :string
  end
end
