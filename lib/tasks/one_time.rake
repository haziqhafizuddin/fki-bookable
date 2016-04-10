namespace :db do
  task 'admin_setup' => :environment do
    puts 'Adding admin'

    if Admin.count == 0
      [
        {
          email: 'haziq.tamsir@surialabs.com',
          password: 'password',
          password_confirmation: 'password'
        }
      ].each do |data|
        Admin.create!(data)
      end
    end
  end
end