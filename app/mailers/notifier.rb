class Notifier < ActionMailer::Base
  default from: 'no-reply-fki@ums.edu.my'

  def received_booking(booking)
    @lecturer_name = booking.lecturer.name
    @email = booking.lecturer.email
    @student_name = booking.user.name
    @matrix_no = booking.user.matrix_no
    @course = booking.course
    @equipment = booking.equipment.name

    mail to: @email, subject: 'Student Booking Received'
  end
end