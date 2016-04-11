require 'rails_helper'

feature 'user booked equipment' do
  let!(:user) { create :user }
  let!(:equipment) { create(:equipment) }
  let(:booking) { build :booking }
  let!(:lecturer) { create :lecturer }

  before(:each) do
    login_user(user)
  end

  it 'should suceessfully booked' do
    find(:link, 'Book Now').click

    select booking.start_time.strftime("%Y"), from: 'booking[start_time(1i)]'
    select booking.start_time.strftime("%B"), from: 'booking[start_time(2i)]'
    select booking.start_time.strftime("%d"), from: 'booking[start_time(3i)]'

    select booking.end_time.strftime("%Y"), from: 'booking[end_time(1i)]'
    select booking.end_time.strftime("%B"), from: 'booking[end_time(2i)]'
    select booking.end_time.strftime("%d"), from: 'booking[end_time(3i)]'

    select booking.quantity, from: 'booking[quantity]'
    select booking.lecturer.name, from: 'booking[lecturer_id]'
    fill_in 'Course', with: booking.course

    find_button('Submit booking').click
    expect(page).to have_content('Your booking is now pending')
  end

  it 'invalid start time' do
    find(:link, 'Book Now').click

    select Date.current.strftime("%Y"), from: 'booking[start_time(1i)]'
    select Date.current.strftime("%B"), from: 'booking[start_time(2i)]'
    select Date.current.strftime("%d"), from: 'booking[start_time(3i)]'

    find_button('Submit booking').click
    expect(page).to have_content('Cannot book in less than one day from now')
  end

  it 'invalid quantity' do
    find(:link, 'Book Now').click

    select booking.start_time.strftime("%Y"), from: 'booking[start_time(1i)]'
    select booking.start_time.strftime("%B"), from: 'booking[start_time(2i)]'
    select booking.start_time.strftime("%d"), from: 'booking[start_time(3i)]'

    select booking.end_time.strftime("%Y"), from: 'booking[end_time(1i)]'
    select booking.end_time.strftime("%B"), from: 'booking[end_time(2i)]'
    select booking.end_time.strftime("%d"), from: 'booking[end_time(3i)]'

    find_button('Submit booking').click
    expect(page).to have_content('Cannot be empty')
  end
end
