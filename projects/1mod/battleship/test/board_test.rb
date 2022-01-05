require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_can_create_cells
    board = Board.new

    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], board.cells.keys
    assert_equal 16, board.cells.count
  end

  def test_if_coordinate_is_on_board
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_for_ship_length_same_as_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_coordinates_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "B2", "B3"])
  end

  def test_it_is_not_diagonal_placement
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
      assert_equal false, board.valid_placement?(cruiser, ["C2", "D3"])
  end

  def test_valid_placement_can_return_true
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_cell_has_a_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_not_overlapping
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
    assert board.valid_placement?(submarine, ["B1", "B2"])
  end

  def test_coordinates_has_same_letters
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal true, board.letters_same?(["A1", "A2"])
    assert_equal false, board.letters_same?(["A1", "B1"])
  end

  def test_coordinates_has_same_number
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal true, board.numbers_same?(["A1", "B1"])
    assert_equal false, board.numbers_same?(["B1", "B2"])
  end

  def test_it_can_render_a_board
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expected1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    expected2 = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"

    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal expected1, board.render
    assert_equal expected2, board.render(true)
  end

  def test_it_can_render_hits_on_a_board
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expected1 = "  1 2 3 4 \nA S H H . \nB . . . . \nC . . . . \nD . . . . \n"

    board.place(cruiser, ["A1", "A2", "A3"])
    board.cells["A3"].fire_upon
    board.cells["A2"].fire_upon

    assert_equal expected1, board.render(true)
  end

  def test_it_can_render_a_sunk_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expected1 = "  1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . \n"

    board.place(cruiser, ["A1", "A2", "A3"])
    board.cells["A3"].fire_upon
    board.cells["A2"].fire_upon
    board.cells["A1"].fire_upon

    assert_equal expected1, board.render(true)
  end

  def test_it_can_render_a_miss_a_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expected1 = "  1 2 3 4 \nA S S S M \nB . . . . \nC . . . . \nD . . . . \n"

    board.place(cruiser, ["A1", "A2", "A3"])
    board.cells["A4"].fire_upon

    assert_equal expected1, board.render(true)
  end
end
