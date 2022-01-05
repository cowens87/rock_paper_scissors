class Event 
  attr_reader :name, :food_trucks
  
  def initialize(name)
    @name        = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck if truck.inventory.keys.include?(item) && truck.inventory[item] > 0 }
  end

  def total_inventory
    all_goods = {}
  
    @food_trucks.each do |truck| 
      truck.inventory.each do |item, amount|
        if all_goods[item].nil?
          all_goods[item] = { 
            quantity: 0,
            food_trucks: []
          }
        end
        all_goods[item][:quantity] += amount
        all_goods[item][:food_trucks] << truck
      end
    end
    all_goods
  end

  def overstocked_items
    total_inventory.select { |item, deets| deets[:food_trucks].count > 1 && deets[:quantity] > 50 }.keys
  end

  def sorted_item_list
    @food_trucks.each_with_object([]) do |truck, items|
      truck.inventory.keys.each do |item|
        items << item.name
      end
    end.uniq.sort 
  end
end