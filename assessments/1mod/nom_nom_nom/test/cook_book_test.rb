require 'minitest/autorun'
require 'minitest/pride'
require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'
require './lib/pantry'
require 'mocha/minitest'

class CookBookTest < Minitest::Test
  def setup
    @cookbook = CookBook.new  #<CookBook:0x00007faae6a42228 @recipes=[]>
    @pantry = Pantry.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of CookBook, @cookbook
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_list_ingredients
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end

  def test_it_can_find_the_highest_calorie_meal
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end 

  # Iteration 4
  def test_it_can_start_with_the_date
    Date.stubs(:today).returns(Date.parse('20201102'))
    cookbook = CookBook.new
    assert_equal "11-02-2020", cookbook.date
  end

  # For the summary, ingredients are listed in order of calories. This is the 
  # amount of calories that ingredient contributes to the total calories of the 
  # recipe, not the amount of calories per single unit of the ingredient.
  def test_it_can_find_the_summary
    recipe2 = Recipe.new("Burger")
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    recipe2.add_ingredient(@ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(recipe2)

    expected = [{
                  :name=>"Mac and Cheese", 
                  :details=>{
                            :ingredients=>[
                                          {:ingredient=>"Macaroni", :amount=>"8 oz"}, 
                                          {:ingredient=>"Cheese", :amount=>"2 C"}
                                        ],
                            :total_calories=>440
                                          }},
                {
                  :name=>"Burger", 
                  :details=>{
                            :ingredients=>[
                                          {:ingredient=>"Ground Beef", :amount=>"4 oz"},
                                          {:ingredient=>"Bun", :amount=>"100 g"}
                                        ], 
                            :total_calories=>500
                                          }}]
    assert_equal expected, @cookbook.summary
  end
end