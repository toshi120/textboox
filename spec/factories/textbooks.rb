FactoryBot.define do
  factory :textbook do
    name        {"RubyonRailsチュートリアル"}
    note        {"Railsの基礎を学ぶことができます。"}
    page        {300}
    association :teacher

    after(:build) do |textbook|
      textbook.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
