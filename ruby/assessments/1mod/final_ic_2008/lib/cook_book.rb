class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
   @recipes.map do |recipe|
            recipe.ingredients
          end
          binding.pry
    list.select do |ingredient|
      ingredient.name
    end
  end

  # def highest_calorie_meal
  #
  # end
end
