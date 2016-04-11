module CapybaraHelpers
  def login_admin(admin)
    visit '/admins/sign_in'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit '/admins'
  end

  def login_user(user)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit root_path
  end
end
