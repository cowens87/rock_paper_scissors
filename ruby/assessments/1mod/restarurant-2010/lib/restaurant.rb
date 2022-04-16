class Restaurant
  attr_reader :opening_time, :name, :dishes 
  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name 
    @dishes = []
  end

  def closing_time(hours)
    new_time = @opening_time.to_i
    added_time = new_time += hours
    "#{added_time}:00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    if @opening_time.to_i < 12
      true
    else
      false
    end
  end

  def menu_dish_names
    @dishes.map do |dish|
      dish.upcase
    end
  end

  def announce_closing_time(hours) 
    if closing_time(hours).to_i < 12
      "#{@name} will be closing at #{closing_time(hours)}AM"
    else
      time = (closing_time(hours).to_i - 12)
      "#{@name} will be closing at #{time}:00PM"
    end 
  end
end