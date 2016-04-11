require 'rails_helper'

feature 'user sign up' do
  let(:user) { build :user }

  it 'user successfully sign up' do
    visit new_user_registration_path
    fill_in 'Name', with: user.name
    fill_in 'Matrix no', with: user.matrix_no
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation

    click_button('Sign up')
    expect(page).to have_content('You have signed up successfully.')
  end

  it 'name should not be blank' do
    visit new_user_registration_path
    fill_in 'Name', with: ''
    fill_in 'Matrix no', with: user.matrix_no
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation

    click_button('Sign up')
    expect(page).to have_content('Namecan\'t be blank')
  end

  it 'email should not be blank' do
    visit new_user_registration_path
    fill_in 'Name', with: user.name
    fill_in 'Matrix no', with: user.matrix_no
    fill_in 'Email', with: ''
    fill_in 'user_password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation

    click_button('Sign up')
    expect(page).to have_content('Emailcan\'t be blank')
  end

  it 'password should not be blank' do
    visit new_user_registration_path
    fill_in 'Name', with: user.name
    fill_in 'Matrix no', with: user.matrix_no
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: ''
    fill_in 'Password confirmation', with: user.password_confirmation

    click_button('Sign up')
    expect(page).to have_content('Passwordcan\'t be blank')
  end

  it 'password should not the same' do
    visit new_user_registration_path
    fill_in 'Name', with: user.name
    fill_in 'Matrix no', with: user.matrix_no
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: 'PassWord'
    fill_in 'Password confirmation', with: user.password_confirmation

    click_button('Sign up')
    error_message = 'Password confirmationdoesn\'t match Password'
    expect(page).to have_content(error_message)
  end
end
