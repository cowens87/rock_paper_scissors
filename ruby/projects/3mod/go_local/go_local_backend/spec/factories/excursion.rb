FactoryBot.define do
  factory :excursion do
    title { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    location { Faker::Address.city }
    user
    place_id { "jkfal#{(0..9).to_a.sample(10).join(',').delete(',').to_s}" }
  end
end
