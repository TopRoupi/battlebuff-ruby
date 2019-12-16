FactoryBot.define do
  factory :room do
    name { Faker::Team.name }
    limit { 10 }
    visible { true }
  end
end
