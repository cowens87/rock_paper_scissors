# frozen_string_literal: true

require 'rails_helper'

describe 'Excursions Show Endpoint' do
  describe 'GET /excursions/:id' do
    it 'can fetch one excursion' do
      VCR.use_cassette('excursion-show-request') do
        place_id = "ChIJFaqhMyt_bIcRMfeTGF4E8kM"
        user = create(:user, id: 1)
        excursion = create(:excursion, user_id: user.id, place_id: place_id)

        get "/api/v1/excursions/#{excursion.id}"

        json_response = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(response.status).to eq(200)

        expect(json_response).to have_key(:attributes)
        expect(json_response[:attributes]).to have_key(:place_id)
        expect(json_response[:attributes][:place_id]).to be_a(String)
        expect(json_response[:attributes]).to have_key(:formatted_address)
        expect(json_response[:attributes][:formatted_address]).to be_a(String)
        expect(json_response[:attributes]).to have_key(:name)
        expect(json_response[:attributes][:name]).to be_a(String)
        expect(json_response[:attributes]).to have_key(:types)
        expect(json_response[:attributes][:types]).to be_an(Array)
        expect(json_response[:attributes]).to have_key(:phone_number)
        expect(json_response[:attributes][:phone_number]).to be_a(String)
        expect(json_response[:attributes]).to have_key(:website)
        expect(json_response[:attributes][:website]).to be_a(String)
        expect(json_response[:attributes]).to have_key(:opening_hours)
        expect(json_response[:attributes][:opening_hours]).to be_an(Array)
        expect(json_response[:attributes]).to have_key(:business_status)
        expect(json_response[:attributes][:business_status]).to be_a(String)
        expect(json_response[:attributes][:title]).to be_a(String)
        expect(json_response[:attributes][:title]).to eq(excursion.title)
        expect(json_response[:attributes][:description]).to be_a(String)
        expect(json_response[:attributes][:description]).to eq(excursion.description)
        expect(json_response[:attributes][:updated_at]).to be_a(String)
        expect(json_response[:attributes][:updated_at].to_date).to eq(excursion.updated_at.to_s.to_date)
      end
    end
  end

  describe 'sad path' do
    it 'rendes error message if microservice is down' do
      place_id = "ChIJFaqhMyt_bIcRMfeTGF4E8kM"
      user = create(:user, id: 1)
      excursion = create(:excursion, user_id: user.id, place_id: place_id)

      stub_request(:get, "https://go-local-maps-api.herokuapp.com/api/v1/place_details?place_id=#{place_id}").to_return(status: 404)

      get "/api/v1/excursions/#{excursion.id}"

      expect(response.status).to eq(404)

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to be_a(Hash)
      expect(json_response).to have_key(:errors)
      expect(json_response[:errors]).to be_an(Array)
      expect(json_response[:errors][0]).to eq('the request could not be completed')
      expect(json_response[:errors][1]).to eq('external Places API unavailable')
    end
  end
end
