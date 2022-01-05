class Park 
  attr_reader :name, 
              :trails
  
  def initialize(name)
    @name   = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(distance)
    @trails.select { |trail| trail.length < distance }
  end

  def hikeable_miles
    @trails.sum(&:length)
  end

  def trails_by_level
    levels = Hash.new {|hash_obj, key| hash_obj[key] = []}
    @trails.each { |trail| levels[trail.level] << trail.name }
    levels
  end

  def visitors_log
    require 'pry'; binding.pry
    # { 
    #   1980: {
              # '6/23' => {hiker: []},
    #         '6/24' => {hiker: []},
    #         '6/25' => {hiker: []}
            # },
  #     2020: {
              # '6/23' => {hiker: []},
    #         '6/24' => {hiker: []},
    #         '6/25' => {hiker: []}
            # },
    # }
  end
end 
