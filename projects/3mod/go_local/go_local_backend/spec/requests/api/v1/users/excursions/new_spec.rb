# frozen_string_literal: true

require 'rails_helper'

describe 'excursions' do
  it 'can create an excursions ' do
    allow(ExcursionsFacade).to receive(:nearest_city)
    user = User.create(id: 1)
    excursion_params = {
                          title: Faker::Coffee.blend_name,
                          description: Faker::Coffee.notes,
                          location: Faker::Address.city,
                          user_id: user.id,
                          place_id: '989aqdjlojfaonflqikjf',
                          coordinates: '(29.9754713, -90.0851898)'
                        }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post "/api/v1/users/#{user.id}/excursions", headers: headers, params: JSON.generate(excursion: excursion_params)

    created_excursion = Excursion.last

    expect(response).to be_successful
    expect(response).to have_http_status(:created)
    expect(created_excursion.title).to eq(excursion_params[:title])
    expect(created_excursion.description).to eq(excursion_params[:description])
    expect(created_excursion.location).to eq(excursion_params[:location])
    expect(created_excursion.user_id).to eq(excursion_params[:user_id])
    expect(created_excursion.place_id).to eq(excursion_params[:place_id])
  end

  it 'adds the nearest city upon creation' do
    allow(ExcursionsFacade).to receive(:nearest_city).and_return('New Orleans, LA')
    user = create(:user)
    excursion_params = attributes_for(:excursion, user_id: user.id).merge(coordinates: "(29.9754713, -90.0851898)")
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post "/api/v1/users/#{user.id}/excursions", headers: headers, params: JSON.generate(excursion: excursion_params)

    created_excursion = Excursion.last
    expect(response).to be_successful
    expect(response).to have_http_status(:created)
    expect(created_excursion.nearest_city).to eq('New Orleans, LA')
  end
end
