require './lib/trail'
require './lib/park'
require './lib/hiker'

RSpec.describe Park do
  before(:each) do
    @trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    @trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    @trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    @trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    @trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    @trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    @park1  = Park.new('Capitol Reef')
    @park2  = Park.new('Bryce Canyon')
    @hiker  = Hiker.new('Dora', :moderate)
  end

  it 'exists' do
    expect(@park1.name).to eq('Capitol Reef')
  end

  it 'has trails' do
    expect(@park1.trails).to eq([])
  end

  it 'can add trails' do
    @park1.add_trail(@trail1)
    @park1.add_trail(@trail2)

    expect(@park1.trails).to eq([@trail1, @trail2])
  end

  it 'can find trails shorter by distance' do
    @park1.add_trail(@trail1)
    @park1.add_trail(@trail2)
    @park1.add_trail(@trail3)
    @park2.add_trail(@trail4)
    @park2.add_trail(@trail5)
    @park2.add_trail(@trail6)

    @hiker.visit(@park1)
    @hiker.visit(@park2)

    expect(@park1.trails_shorter_than(2.5)).to eq([@trail1, @trail2])
    expect(@park2.trails_shorter_than(2.5)).to eq([])
  end
  
  it 'can sum hikable miles' do
    @park1.add_trail(@trail1)
    @park1.add_trail(@trail2)
    @park1.add_trail(@trail3)
    @park2.add_trail(@trail4)
    @park2.add_trail(@trail5)
    @park2.add_trail(@trail6)

    @hiker.visit(@park1)
    @hiker.visit(@park2)

    expect(@park1.hikeable_miles).to eq(7.5)
    expect(@park2.hikeable_miles).to eq(16.9)
  end
  
  it 'can list trails by level' do
    @park1.add_trail(@trail1)
    @park1.add_trail(@trail2)
    @park1.add_trail(@trail3)
    @park2.add_trail(@trail4)
    @park2.add_trail(@trail5)
    @park2.add_trail(@trail6)

    expected = {
                easy:     ["Grand Wash"],
                moderate: ["Cohab Canyon"],
                strenuous:["Chimney Rock Loop"]
              }

    expect(@park1.trails_by_level).to eq(expected)

    expected = {
                moderate: ["Queen's/Navajo Loop", "Tower Bridge"],
                easy:     ["Rim Trail"]
              }
    expect(@park2.trails_by_level).to eq(expected)
  end

  it 'can create a visitors log' do
    trail1 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail2 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail3 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})
    trail4 = Trail.new({name: 'Peekaboo Loop', length: '5.5 miles', level: :strenuous})

    park   = Park.new('Bryce Canyon')

    park.add_trail(trail1)
    park.add_trail(trail2)
    park.add_trail(trail3)
    park.add_trail(trail4)

    hiker1 = Hiker.new('Dora', :moderate)
    hiker2 = Hiker.new('Frank', :easy)
    hiker3 = Hiker.new('Jack', :strenuous)
    hiker4 = Hiker.new('Sally', :strenuous)

    hiker1.visit(park) #This visit occurs on June 23, 1980
    hiker2.visit(park) #This visit occurs on June 24, 1980
    hiker3.visit(park) #This visit occurs on June 24, 1980
    hiker4.visit(park) #This visit occurs on June 25, 1980
    hiker1.visit(park) #This visit occurs on June 23, 2020
    hiker2.visit(park) #This visit occurs on June 24, 2020
    hiker3.visit(park) #This visit occurs on June 24, 2020
    hiker4.visit(park) #This visit occurs on June 25, 2020

    # expected = {
    #           1980 => {
    #             "06/23" => {
    #               hiker1 => [#<Trail:0x00007f8f040e25c8...>, #<Trail:0x00007f8f03191ee8...>]
    #             },
    #             "06/24" => {
    #               hiker2 => [#<Trail:0x00007f8f022c6878...>],
    #               hiker3 => [#<Trail:0x00007f8f022e5160...>]
    #             },
    #             "06/25" => {
    #               hiker4 => [#<Trail:0x00007f8f022e5160...>]
    #             }
    #           },
    #           2020 => {
    #             "06/23" => {
    #               #<Hiker:0x00007f8f02184208...> => [#<Trail:0x00007f8f040e25c8...>, #<Trail:0x00007f8f03191ee8...>]
    #             },
    #             "06/24" => {
    #               #<Hiker:0x00007f8f029afb30...> => [#<Trail:0x00007f8f022c6878...>],
    #               #<Hiker:0x00007f8f04045e30...> => [#<Trail:0x00007f8f022e5160...>]
    #             },
    #             "06/25" => {
    #               #<Hiker:0x00007f8f02326390...> => [#<Trail:0x00007f8f022e5160...>]
    #             }
    #           },
    #           }
    # expect(park.visitors_log).to eq(expected)
  end
end