require 'rails_helper'

describe 'PlaceDetailsService' do
  it 'get_place_details' do
    fixture_json = File.read('spec/fixtures/place_details_results.json')
    place_id = "ChIJFaqhMyt_bIcRMfeTGF4E8kM"
    stub_request(:get, "https://go-local-maps-api.herokuapp.com/api/v1/place_details?place_id=#{place_id}").to_return(status: 200, body: fixture_json)

    json_response = PlaceDetailsService.get_place_details(place_id)[:data]

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
