class Equipment < ActiveRecord::Base
  validates :name, presence: true
  has_many :bookings

  mount_uploader :image, ImageUploader
end
