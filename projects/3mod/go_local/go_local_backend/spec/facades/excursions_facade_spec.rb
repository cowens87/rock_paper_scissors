require 'rails_helper'

RSpec.describe ExcursionsFacade do
  it 'adds the nearest city upon creation' do
    VCR.use_cassette('new_orleans') do
      city = ExcursionsFacade.nearest_city('(29.9754713, -90.0851898)')
      expect(city).to eq('New Orleans, LA')
    end
  end
end
