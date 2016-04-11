class Lecturer < ActiveRecord::Base
  has_many :bookings
  validates :name, :email, presence: true
end
