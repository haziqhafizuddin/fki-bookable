require 'rails_helper'

feature 'Admin create equipments' do
  let!(:admin) { create :admin }
  let(:equipment) { create :equipment }

  before(:each) do
    login_admin(admin)
  end

  it 'equipment successfully created' do
    first(:link, 'Equipment').click
    click_link('Add new')
    fill_in 'Name', with: equipment.name
    fill_in 'Description', with: equipment.description
    fill_in 'Quantity', with: equipment.quantity
    equipment_image = Rails.root.join('spec/fixtures/equipment_image.png')
    attach_file('equipment_image', equipment_image)
    find_button('Save').click

    expect(page).to have_content('Equipment successfully created')
    expect(page).to have_content(equipment.name)
  end

  it 'name cannot be blank' do
    first(:link, 'Equipment').click
    click_link('Add new')
    fill_in 'Name', with: ''
    find_button('Save').click

    expect(page).to have_content('Name can\'t be blank')
  end
end
