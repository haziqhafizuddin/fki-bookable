class Booking < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :user

  validates :user_id, :equipment_id, :quantity, presence: true
  validates_presence_of :start_time, :end_time, on: :update
  validate :booking_time, on: :update
  validates :quantity, numericality: { greater_than: 0 }

  enum status: ['pending', 'approved', 'rejected', 'borrowed', 'returned', 'delayed', 'void']

  after_create :set_status

  def set_status
    self.update_columns(status: 'pending')
  end

  def booking_time
    if start_time && start_time <= 1.hour.from_now
      errors.add :start_time, 'Cannot book in less than one hour from now'
    end

    if end_time && end_time <= start_time
      errors.add :base, 'Invalid start and end time'
    end
  end

  def deduct_quantity
    
  end
end
