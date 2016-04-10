class Equipment < ActiveRecord::Base
  validates :name, presence: true
  has_many :bookings
end
