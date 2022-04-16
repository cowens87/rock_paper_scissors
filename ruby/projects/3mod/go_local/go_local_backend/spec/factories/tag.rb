FactoryBot.define do
  factory :tag do
    name { Faker::Movies::LordOfTheRings.character }
  end
end
