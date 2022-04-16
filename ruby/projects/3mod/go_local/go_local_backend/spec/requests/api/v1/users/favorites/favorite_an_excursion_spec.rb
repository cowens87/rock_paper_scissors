# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite do
  describe 'User favorite excursions' do
    it 'can add an excursion to user favorites' do
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
      traveler   = User.create(id: 2)

      expect(Favorite.count).to eq(0)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/users/#{traveler.id}/favorites/#{excursion2.id}", headers: headers, params: JSON.generate(excursion2)

      expect(Favorite.count).to eq(1)
      expect(traveler.favorites.count).to eq(1)

      traveler_favorite = Favorite.where(user_id: traveler.id).last.excursion
      
      expect(response).to be_successful
      expect(traveler_favorite.title).to eq(excursion2[:title])
      expect(traveler_favorite.description).to eq(excursion2[:description])
    end
  end
end
