FactoryBot.define do
  factory :student do
    name     { Faker::Japanese::Name.last_name }
    email    { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
  end
end
