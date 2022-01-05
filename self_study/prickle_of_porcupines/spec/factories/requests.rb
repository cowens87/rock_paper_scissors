FactoryBot.define do
  factory :request do 
    name        {Faker::TvShows::BojackHorseman.character}
    address     {"#{Faker::Number.number(digits: 5)} #{Faker::Address.street_name} #{Faker::Address.street_suffix}"}
    city        {Faker::Address.city}
    state       {Faker::Address.state_abbr}
    zip         {Faker::Address.zip}
    reason      {Faker::TvShows::FamilyGuy.quote}
    status      {0}
  end
end
