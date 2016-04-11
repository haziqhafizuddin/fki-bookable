require 'rails_helper'

feature 'Admin create lecturer' do
  let!(:admin) { create :admin }
  let(:lecturer) { create :lecturer }

  before(:each) do
    login_admin(admin)
  end

  it 'lecturer successfully created' do
    first(:link, 'Lecturer').click
    click_link('Add new')
    fill_in 'Name', with: lecturer.name
    fill_in 'Email', with: lecturer.email
    find_button('Save').click

    expect(page).to have_content('Lecturer successfully created')
  end

  it 'name cannot be blank' do
    first(:link, 'Lecturer').click
    click_link('Add new')
    fill_in 'Name', with: ''
    fill_in 'Email', with: lecturer.email
    find_button('Save').click

    expect(page).to have_content('Name can\'t be blank')
  end

end