FactoryBot.define do
  factory :message do
    association :player
    association :room
    content { Faker::Lorem.sentence }
  end
end
