FactoryBot.define do
  factory :student do
    name     {Faker::Japanese::Name.name}
    
  end
end
