FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    name Faker::Name.name
    matrix_no Faker::Number.number(10)
  end
end
