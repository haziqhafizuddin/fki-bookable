class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_booking, only: [:edit, :update, :show, :cancel]
  before_filter :set_equipment, only: [:new]
  before_filter :set_lecturers, only: [:edit, :update]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.create!(user_id: current_user.id, equipment_id: @equipment.id)
    redirect_to edit_booking_path(@booking)
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      Notifier.received_booking(@booking).deliver_now!
      redirect_to booking_path(@booking), notice: 'Your booking is now pending'
    else
      render :edit
    end
  end

  def show
  end

  def cancel
    @booking.update_attributes(status: 'void')

    redirect_to booking_path(@booking), notice: 'Your booking has been cancel'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_lecturers
    @lecturers = Lecturer.all
  end

  def booking_params
    params.require(:booking).permit(:id, :user_id, :equipment_id,
                                    :start_time, :end_time, :quantity,
                                    :lecturer_id, :course)
  end

  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end
end
