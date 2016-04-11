FactoryGirl.define do
  factory :equipment do
    name Faker::Name.name
    description Faker::Hipster.paragraph
    quantity Faker::Number.number(2)
    image Faker::Placeholdit.image
  end
end
