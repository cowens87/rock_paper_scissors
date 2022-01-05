class House
 attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    price = "#{@price.delete "$"}".to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500000
  end

  def rooms_from_category(category)
    rooms.find_all do |room|
     room.category == category
   end
  end

  def area
    area = 0
    @rooms.each do |room|
      area += room.area
    # @rooms.sum do |room|
    #   room.area
   end
   area
  end

  def details
    {
      "price" => @price,
      "address" => @address
    }
  end

  def price_per_sq_foot
    rooms_by_category(category)
    (price._to_f/ area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
  end.reverse

  def rooms_sorted_by_category
    result= {}
    @rooms.each do |room|
      if result[room.category]
        result[room.category] << room
      else
        result[room.category] = [room]
      end
  end
  result

  #or you can also do
  @rooms.group_by do |room|
    room.category
  end
end
