# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite do
  describe 'User favorite excursions' do
    it 'can see all their favorites' do
      local_id   = User.create(id: 1).id
      excursion1 = Excursion.create({
                    title: 'Beach Party',
                    description: 'Local Beach Party with Friends',
                    location: 'Santa Cruz, CA',
                    user_id: local_id,
                    place_id: '389aqdjlojfaonfhkljhf'
                })
      excursion2 = Excursion.create({
                    title: 'Yummy Belly Tea',
                    description: 'Tea Shop',
                    location: 'Santa Cruz, CA',
                    user_id: local_id,
                    place_id: '385464jlojfaonfljhf'
                })

      excursion3 = Excursion.create({
                    title: 'Yummy Belly Tea',
                    description: 'Tea Shop',
                    location: 'Santa Cruz, CA',
                    user_id: local_id,
                    place_id: '385464jlojfaonfljhf'
                })
      traveler   = User.create(id: 2)
      Favorite.create(user_id: traveler.id, excursion_id: excursion2.id)
      Favorite.create(user_id: traveler.id, excursion_id: excursion3.id)

      get "/api/v1/users/#{traveler.id}/favorites"

      expect(response).to be_successful
      favorites = JSON.parse(response.body, symbolize_names: true)

      expect(favorites).to be_a(Hash)
      expect(favorites).to have_key(:data)
      expect(favorites).to have_key(:meta)
      expect(favorites.keys).to match_array(%i[data meta])
      expect(favorites[:data]).to be_an(Array)
      expect(favorites[:data].size).to eq(2)
      expect(favorites[:data][0]).to be_a(Hash)
      expect(favorites[:data][0]).to have_key(:id)
      expect(favorites[:data][0][:id]).to be_a(String)
      expect(favorites[:data][0]).to have_key(:type)
      expect(favorites[:data][0][:type]).to eq('excursion')
      expect(favorites[:data][0]).to have_key(:attributes)
      expect(favorites[:data][0][:attributes]).to be_a(Hash)
      expect(favorites[:data][0][:attributes]).to have_key(:title)
      expect(favorites[:data][0][:attributes]).to have_key(:description)
      expect(favorites[:data][0][:attributes]).to have_key(:location)
      expect(favorites[:data][0][:attributes]).to have_key(:user_id)
      expect(favorites[:data][0][:attributes]).to have_key(:place_id)
      expect(favorites[:data][0][:attributes]).to have_key(:nearest_city)
      expect(favorites[:meta]).to be_a(Hash)
      expect(favorites[:meta]).to have_key(:cities)
      expect(favorites[:meta][:cities]).to be_an(Array)
    end
  end
end
