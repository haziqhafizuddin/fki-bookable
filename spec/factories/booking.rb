FactoryGirl.define do
  factory :booking do
    user
    equipment
    start_time Date.current + 1
    end_time Date.current + 4
    status 'pending'
    quantity 1
    lecturer
    course Faker::Hipster.word
  end
end
