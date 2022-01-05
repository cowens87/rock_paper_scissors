require 'rails_helper'

RSpec.describe ParksInfo do
  it 'exists' do
    # represents the info on the right of the = sign
    attrs = {
      fullName: 'Happy Park',
      operatingHours: [{standardHours: {
              :wednesday=>"9:00AM - 4:00PM", 
              :monday=>"Closed", 
              :thursday=>"9:00AM - 4:00PM", 
              :sunday=>"Closed", 
              :tuesday=>"9:00AM - 4:00PM", 
              :friday=>"9:00AM - 4:00PM", 
              :saturday=>"9:00AM - 4:00PM"
              }}],
      directionsInfo: 'Turn left at Go Lucky Lane',
      description: 'The happiest park on the planet'
    }

    park = ParksInfo.new(attrs)
    expect(park).to be_a ParksInfo
    expect(park).to have_attributes(
      # represents the info on the left of the = sign
                                    name: 'Happy Park',
                                    hours: {
                                            :wednesday=>"9:00AM - 4:00PM", 
                                            :monday=>"Closed", 
                                            :thursday=>"9:00AM - 4:00PM", 
                                            :sunday=>"Closed", 
                                            :tuesday=>"9:00AM - 4:00PM", 
                                            :friday=>"9:00AM - 4:00PM", 
                                            :saturday=>"9:00AM - 4:00PM"
                                          },
                                    directions: 'Turn left at Go Lucky Lane',
                                    description: 'The happiest park on the planet'
                                  )
  end
end
