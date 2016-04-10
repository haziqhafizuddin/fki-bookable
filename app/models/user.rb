class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
  validates :matrix_no, presence: true
end
