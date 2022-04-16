require 'rails_helper'

describe 'receive_fe_request' do
  it 'receive place search request from FE & return response from microservice as is' do\
    VCR.use_cassette("place_search") do
      be_search_details = "casa-bonita-denver-co"
      get "/api/v1/place_search?title=casa%20bonita&location=Denver,%20CO"
      json_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response.status).to eq(200)
      expect(json_response).to have_key(:attributes)
      expect(json_response[:attributes]).to have_key(:place_id)
      expect(json_response[:attributes][:place_id]).to be_a(String)
      expect(json_response[:attributes]).to have_key(:formatted_address)
      expect(json_response[:attributes][:formatted_address]).to be_a(String)
      expect(json_response[:attributes]).to have_key(:name)
      expect(json_response[:attributes][:name]).to be_a(String)
    end
  end
  it 'receive place details request from FE & return response from a microservice as is' do
    VCR.use_cassette("place_details") do
      place_id = "ChIJFaqhMyt_bIcRMfeTGF4E8kM"

      get "/api/v1/place_details?place_id=#{place_id}"

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
      expect(json_response[:attributes]).to have_key(:formatted_phone_number)
      expect(json_response[:attributes][:formatted_phone_number]).to be_a(String)
      expect(json_response[:attributes]).to have_key(:website)
      expect(json_response[:attributes][:website]).to be_a(String)
      expect(json_response[:attributes]).to have_key(:opening_hours)
      expect(json_response[:attributes][:opening_hours]).to be_an(Array)
      expect(json_response[:attributes]).to have_key(:business_status)
      expect(json_response[:attributes][:business_status]).to be_a(String)
    end
  end
end
