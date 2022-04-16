# frozen_string_literal: true

require 'rails_helper'

describe 'Excursions Index Endpoint' do
  describe 'GET /excursions' do
    it 'can fetch all excursion' do
      user = User.create(id: 1).id
      create_list(:excursion, 6, user_id: user)

      get '/api/v1/excursions'

      expect(response).to be_successful
      excursions = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(excursions.count).to eq(6)

      excursions.each do |excursion|
        check_hash_structure(excursion, :type, String)

        excursion_details = excursion[:attributes]

        check_hash_structure(excursion_details, :title, String)
        check_hash_structure(excursion_details, :description, String)
        check_hash_structure(excursion_details, :location, String)
        check_hash_structure(excursion_details, :user_id, Integer)
      end
    end
  end

  describe 'city search' do
    it 'returns a list of available cities with the response' do
      create_list(:excursion, 2, nearest_city: 'Chicago, IL')
      create(:excursion, nearest_city: 'Philadelphia, PA')
      create_list(:excursion, 2, nearest_city: 'San Antonio, TX')
      create(:excursion, nearest_city: 'Austin, TX')

      get '/api/v1/excursions'

      expect(response).to be_successful
      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to have_key(:meta)
      expect(body[:meta]).to be_a(Hash)
      expect(body[:meta]).to have_key(:cities)
      expect(body[:meta][:cities]).to be_an(Array)
      cities = ['Chicago, IL', 'Philadelphia, PA', 'San Antonio, TX', 'Austin, TX']
      expect(body[:meta][:cities]).to match_array(cities)
    end

    it 'returns a list of cities excursions filtered by city' do
      austin = create_list(:excursion, 2, nearest_city: 'Austin, TX')
      not_austin = [create(:excursion, nearest_city: 'Chicago, IL'),
                    create(:excursion, nearest_city: 'Philadelphia, PA'),
                    create(:excursion, nearest_city: 'San Antonio, TX')
                    ]

      get '/api/v1/excursions?city=Austin,%20TX'

      expect(response).to be_successful
      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)
      expect(body).to have_key(:meta)
      expect(body.keys).to match_array(%i[data meta])
      expect(body[:data]).to be_an(Array)
      expect(body[:data].size).to eq(2)
      expect(body[:data][0]).to be_a(Hash)
      expect(body[:data][0]).to have_key(:id)
      expect(body[:data][0][:id]).to be_a(String)
      expect(body[:data][0]).to have_key(:type)
      expect(body[:data][0][:type]).to eq('excursion')
      expect(body[:data][0]).to have_key(:attributes)
      expect(body[:data][0][:attributes]).to be_a(Hash)
      expect(body[:data][0][:attributes]).to have_key(:title)
      expect(body[:data][0][:attributes]).to have_key(:description)
      expect(body[:data][0][:attributes]).to have_key(:location)
      expect(body[:data][0][:attributes]).to have_key(:user_id)
      expect(body[:data][0][:attributes]).to have_key(:place_id)
      expect(body[:data][0][:attributes]).to have_key(:nearest_city)
      all_austin = body[:data].all? do |exc|
        exc[:attributes][:nearest_city] == 'Austin, TX'
      end
      expect(all_austin).to be true
      expect(body[:meta]).to be_a(Hash)
      expect(body[:meta]).to have_key(:cities)
      expect(body[:meta][:cities]).to be_an(Array)
      expect(body[:meta][:cities]).to eq(['Austin, TX'])
    end
  end
end
