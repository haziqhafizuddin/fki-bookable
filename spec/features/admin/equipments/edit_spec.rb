require 'rails_helper'

feature 'Admin edit equipments' do
  let!(:admin) { create :admin }
  let!(:equipment) { create :equipment }

  before(:each) do
    login_admin(admin)
  end

  it 'equipment successfully update' do
    first(:link, 'Equipment').click

    within('tr.equipment_row') do
      find("a[href='/admin/equipment/#{equipment.id}/edit']").click
    end

    fill_in 'Name', with: 'New Name'
    find_button('Save').click

    expect(page).to have_content('Equipment successfully updated')
  end
end
