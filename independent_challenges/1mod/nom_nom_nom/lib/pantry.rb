class Pantry
  attr_reader :stock
  
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, qty)
    @stock[ingredient] += qty 
  end

  # def enough_ingredients_for?(recipe)
  #   enough = false 
  #   @stock.each do |ingredient, qty|
  #     recipe.ingredients_required.each do |item, quantity|
  #       if ingredient == item && qty >= quantity
  #         enough = true
  #       else  
  #         enough = false
  #       end  
  #     end  
  #   end 
  #   enough
  # end 

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, qty|
      qty <= @stock[ingredient]
    end 
  end
end