require 'rails_helper'

feature 'Admin edit lecturer' do
  let!(:admin) { create :admin }
  let!(:lecturer) { create :lecturer }

  before(:each) do
    login_admin(admin)
  end

  it 'lecturer successfully update' do
    first(:link, 'Lecturer').click

    within('tr.lecturer_row') do
      find("a[href='/admin/lecturer/#{lecturer.id}/edit']").click
    end

    fill_in 'Name', with: 'New Name'
    find_button('Save').click

    expect(page).to have_content('Lecturer successfully updated')
  end
end