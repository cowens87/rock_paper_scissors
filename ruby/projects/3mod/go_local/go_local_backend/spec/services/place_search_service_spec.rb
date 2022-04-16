require 'rails_helper'

describe 'PlaceSearchService' do
  it '.get_location_details' do
    fixture_json = File.read('spec/fixtures/place_search_result.json')
    place_info = "casa-bonita-Denver-CO"
    stub_request(:get, "https://go-local-maps-api.herokuapp.com/api/v1/place_search?location=#{place_info}").to_return(status: 200, body: fixture_json)
    
    expect(PlaceSearchService.get_location(place_info)).to eq(fixture_json)

    json_response = JSON.parse(PlaceSearchService.get_location(place_info), symbolize_names: true)[:data]

    expect(json_response).to have_key(:attributes)
    expect(json_response[:attributes]).to have_key(:place_id)
    expect(json_response[:attributes][:place_id]).to be_a(String)
    expect(json_response[:attributes]).to have_key(:formatted_address)
    expect(json_response[:attributes][:formatted_address]).to be_a(String)
    expect(json_response[:attributes]).to have_key(:name)
    expect(json_response[:attributes][:name]).to be_a(String)
  end
end