FactoryGirl.define do
  factory :lecturer do
    sequence(:email) { |n| "lecturer#{n}@example.com" }
    name Faker::Name.name
  end
end
