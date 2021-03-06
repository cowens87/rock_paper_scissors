require "minitest/autorun"
require "minitest/pride"
require "./lib/shopping_cart"
require './lib/product'

class ShoppingCartTest < Minitest::Test
  #Iteration2
  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  def test_it_exists_and_has_attributes
    assert_instance_of ShoppingCart, @cart
    assert_equal "King Soopers", @cart.name
    assert_equal 30, @cart.capacity
  end

  def test_it_can_add_products
    assert_equal [], @cart.products

    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal [@product1, @product2], @cart.products
  end

  def test_it_can_list_cart_details
    expected = {
                name: "King Soopers",
                capacity: 30
              }
    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal expected, @cart.details
  end

  # Iteration3
  def test_it_can_find_total_num_of_products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    assert_equal 13, @cart.total_number_of_products
  end

  def test_if_a_cart_is_full
    # A shopping cart is full if its total number of products exceeds
    # its capacity.
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    assert_equal false, @cart.is_full?

    @cart.add_product(@product4)

    assert_equal true, @cart.is_full?
  end

  def test_it_can_find_products_by_category
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)
    
    assert_equal [@product1, @product3], @cart.products_by_category(:paper)
  end

  # Iteration4
  def test_it_can_calculate_the_percentage_occupied
    # The calculation for a cart's percentage occupied begins by dividing how
    # much it currently has in it by the amount that it can hold.
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    assert_equal 43.33, @cart.percentage_occupied
  end

  def test_it_can_sort_by_quantity
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    assert_equal [@product4, @product1, @product2, @product3], @cart.sorted_products_by_quantity
  end

  def test_it_can_list_a_product_breakdown
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)
    expected = {
                :meat     =>  [@product2],
                :paper    =>  [@product1, @product3],
                :produce  =>  [@product4]
              }
    assert_equal expected, @cart.product_breakdown
  end
end
