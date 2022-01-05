class FoodTruck
  attr_reader :name,
              :inventory,
              :stock_qty

  def initialize(name)
    @name = name
    @inventory = Hash.new(0) #when you want to set a default value
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end
end
