require 'date'

class CookBook
  attr_reader :recipes

  def initialize
   @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients 
    @recipes.each_with_object([]) do |recipe, names|
      recipe.ingredients_required.each do |ingredient, qty|
        names << ingredient.name 
      end
    end.uniq
  end

  def highest_calorie_meal
      @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def date
    Date.today.strftime('%m-%d-%Y')
  end

 def summary
    info = []
    @recipes.each do |recipe|
      recipe_summary = {
                        name: recipe.name,
                        details: {
                                  ingredients: [],
                                  total_calories: recipe.total_calories
                                  }
                      }
      sorted_ingredients = recipe.ingredients.sort_by do |ingred|
        ingred.calories * recipe.ingredients_required[ingred]
      end.reverse
      sorted_ingredients.each do |ingred|
        ingred_details = {
                          ingredient: ingred.name,
                          amount: "#{recipe.ingredients_required[ingred]} #{ingred.unit}"
                        }
        recipe_summary[:details][:ingredients] << ingred_details
      end
      info << recipe_summary
    end
    info
  end
end