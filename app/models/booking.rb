class Booking < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :user
  belongs_to :lecturer

  validates :user_id, :equipment_id, presence: true
  validates_presence_of :start_time, :end_time, :lecturer_id, on: :update
  validate :booking_time, on: :update
  validate :check_quantity, on: :update

  enum status: ['pending', 'approved', 'rejected', 'borrowed', 'returned', 'delayed', 'void']

  after_create :set_status
  # after_save :add_deduct_quantity
  validate :check_available_date, on: :update

  def set_status
    self.update_columns(status: 'pending')
  end

  def booking_time
    if start_time && start_time <= Date.current
      errors.add :start_time, 'Cannot book in less than one day from now'
    end

    if end_time && end_time <= start_time
      errors.add :end_time, 'Cannot book less than start time'
    end
  end

  def check_quantity
    if quantity == nil
      errors.add :quantity, 'Cannot be empty'
    end
  end

  def add_deduct_quantity
    if status == 'borrowed'
      total = self.equipment.quantity - quantity
      Equipment.find(equipment_id).update_columns(quantity: total)
    end

    if status == 'returned'
      total = self.equipment.quantity + quantity
      Equipment.find(equipment_id).update_columns(quantity: total)
    end
  end

  def check_available_date
    start_query = Booking.where(start_time: start_time, equipment_id: equipment_id).approved
    end_query = Booking.where(end_time: end_time, equipment_id: equipment_id).approved

    start_time_quantity = start_query.collect { |a| a.quantity}.sum
    end_time_quantity = end_query.collect { |a| a.quantity}.sum

    if start_time_quantity >= Equipment.find(equipment_id).quantity || end_time_quantity >= Equipment.find(equipment_id).quantity
      errors.add :start_time, 'Equipment fully booked'
    end
  end
end
