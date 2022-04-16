require 'rails_helper'

describe 'Excursion Details Poros' do
  it 'can initialize and package JSON data with Excursion AR object' do
    user = create(:user, id: 1)
    excursion = create(:excursion, user_id: user.id)
    json_fixture = File.read('spec/fixtures/place_details_results.json')
    json_data = JSON.parse(json_fixture, symbolize_names: true)
    poro = ExcursionDetails.new(json_data, excursion)

    expect(poro.id).to be_a(Integer)
    expect(poro.id).to eq(excursion.id)
    expect(poro.formatted_address).to be_a(String)
    expect(poro.formatted_address).to eq(json_data[:data][:attributes][:formatted_address])
    expect(poro.name).to be_a(String)
    expect(poro.name).to eq(json_data[:data][:attributes][:name])
    expect(poro.types).to be_a(Array)
    expect(poro.types).to eq(json_data[:data][:attributes][:types])
    expect(poro.phone_number).to be_a(String)
    expect(poro.phone_number).to eq(json_data[:data][:attributes][:formatted_phone_number])
    expect(poro.website).to be_a(String)
    expect(poro.website).to eq(json_data[:data][:attributes][:website])
    expect(poro.opening_hours).to be_a(Array)
    expect(poro.opening_hours).to eq(json_data[:data][:attributes][:opening_hours])
    expect(poro.title).to be_a(String)
    expect(poro.title).to eq(excursion.title)
    expect(poro.description).to be_a(String)
    expect(poro.description).to eq(excursion.description)
    expect(poro.updated_at).to be_a(ActiveSupport::TimeWithZone)
    expect(poro.updated_at).to eq(excursion.updated_at)
  end
end