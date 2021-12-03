FactoryBot.define do
  factory :entity do
    name { Faker::Name.name }
    amount { Faker::Number.number(2) }
    user_id { Faker::Number.within(range: 1..10) }
  end
end
