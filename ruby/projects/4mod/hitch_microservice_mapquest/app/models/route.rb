class Route 
  attr_reader :route

  def initialize(data)
    @route = data[:route]
  end
end