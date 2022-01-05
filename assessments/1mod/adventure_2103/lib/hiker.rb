class Hiker 
  attr_reader :name, 
              :experience_level, 
              :snacks,
              :parks_visited
  
  def initialize(name, experience_level)
    @name             = name
    @experience_level = experience_level
    @snacks           = Hash.new(0)
    @parks_visited    = [] 
  end

  def pack(item, qty)
    @snacks[item] += qty
  end

  def visit(park)
    @parks_visited << park
  end

  def possible_trails
    @parks_visited.each_with_object([]) do |park, can_do| 
      park.trails.each do |trail| 
        can_do << trail if trail.level == experience_level
      end
    end
  end

  def favorite_snack
    @snacks.max_by { |name, qty| qty }[0]
  end
end