FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    icon { Faker::Avatar.image }
    user_id { Faker::Number.within(range: 1..10) }
  end
end