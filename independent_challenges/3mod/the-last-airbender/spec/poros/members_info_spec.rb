require 'rails_helper'

RSpec.describe MembersInfo do
  it 'exists' do
    # represents the info on the right of the = sign
    attrs = {
      name: 'Happy member',
      photoUrl: "https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128",
      allies: ['ally1', 'ally2', 'ally3'],
      enemies: ['enemy1', 'enemy2', 'enemy3'],
      affiliation: ['affiliation1', 'affiliation2', 'affiliation3']
    }

    member = MembersInfo.new(attrs)
    expect(member).to be_a MembersInfo
    expect(member).to have_attributes(
      # represents the info on the left of the = sign
                                    name: 'Happy member',
                                    photo: "https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128",
                                    allies: ['ally1', 'ally2', 'ally3'],
                                    enemies: ['enemy1', 'enemy2', 'enemy3'],
                                    affiliations: ['affiliation1', 'affiliation2', 'affiliation3']
                                  )
  end
end
