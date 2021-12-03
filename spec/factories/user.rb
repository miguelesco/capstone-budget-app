FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Movies::StarWars.character }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
