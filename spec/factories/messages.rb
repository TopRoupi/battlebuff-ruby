FactoryBot.define do
  factory :message do
    association :player
    content { Faker::Lorem.sentence }
  end
end
