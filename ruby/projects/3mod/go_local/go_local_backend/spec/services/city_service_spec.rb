require 'rails_helper'

RSpec.describe CityService do
  it 'gets a JSON response with the name of the nearest large city' do
    VCR.use_cassette('denver') do
      coordinates = '39.7526-105.0249'
      data = CityService.nearest_city(coordinates)

      expect(data).to be_a(Hash)
      check_hash_structure(data, :data, Hash)
      check_hash_structure(data[:data], :id, NilClass)
      check_hash_structure(data[:data], :type, String)
      expect(data[:data][:type]).to eq('city')
      check_hash_structure(data[:data], :attributes, Hash)
      check_hash_structure(data[:data][:attributes], :name, String)
      check_hash_structure(data[:data][:attributes], :state, String)
      expect(data.keys).to match_array(%i[data])
      expect(data[:data].keys).to match_array(%i[id type attributes])
      expect(data[:data][:attributes].keys).to match_array(%i[name state])
    end
  end

  it 'returns null if no city is found' do
    VCR.use_cassette('rural_area') do
      coordinates = '43.6065-72.9794'
      data = CityService.nearest_city(coordinates)

      expect(data).to be_a(Hash)
      check_hash_structure(data, :data, NilClass)
    end
  end
end
