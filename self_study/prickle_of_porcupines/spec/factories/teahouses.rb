FactoryBot.define do
  factory :teahouse do 
    name    {"#{Faker::TvShows::RickAndMorty.character} Teahouse"}
    address {"#{Faker::Number.number(digits: 5)} #{Faker::TvShows::RickAndMorty.location}"}
    city    {Faker::Address.city}
    state   {Faker::Address.state_abbr}
    zip     {Faker::Address.zip}
  end
end 
