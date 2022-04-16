class Game
  require './lib/board.rb'
  require './lib/cell.rb'
  require './lib/ship.rb'
  attr_reader :player_board,
              :player_cruiser,
              :player_submarine,
              :computer_board,
              :computer_cruiser,
              :computer_submarine
  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def welcome_message
    "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit"
  end

  def start
    puts welcome_message
    user_input = gets.chomp.downcase
    if user_input == 'p'
      run
    elsif user_input == 'q'
      puts 'See you next time!'
      exit
    else
      puts "I don't know what that is. Please enter p or q"
      puts "\n┐(￣∀￣)┌\n\n" +"========================================"
      self.start
    end
  end

  def run
    computer_placement
    player_ship_placement
    until game_over? do
      display_board
      player_shot
      computer_shot
    end
    end_game_message
    self.start
  end

  def end_game_message
    if player_ships_sunk?
      computer_won_game_message
    else
      player_won_game_message
    end
  end

#-----------SETUP

  def computer_placement
    random_coordinates_cruiser
    random_coordinates_submarine
  end

  def random_coordinates_cruiser
    random_coordinates = @computer_board.cells.keys.sample(3)
      until @computer_board.valid_placement?(@computer_cruiser, random_coordinates)
        random_coordinates = @computer_board.cells.keys.sample(3)
      end
    @computer_board.place(@computer_cruiser, random_coordinates)
  end

  def random_coordinates_submarine
    random_coordinates = @computer_board.cells.keys.sample(2)
      until @computer_board.valid_placement?(@computer_submarine, random_coordinates)
        random_coordinates = @computer_board.cells.keys.sample(2)
      end
    @computer_board.place(@computer_submarine, random_coordinates)
  end

  def player_ship_placement
    turn_start_message
    render_player_board
    cruiser_prompt
    user_input = gets.chomp.upcase.split(" ")
      until @player_board.valid_placement?(@player_cruiser, user_input)
        invalid_coord_prompt
        user_input = gets.chomp.upcase.split(" ")
      end
      @player_board.place(@player_cruiser, user_input)
    render_player_board
    submarine_prompt
    user_input = gets.chomp.upcase.split(" ")
      until @player_board.valid_placement?(@player_submarine, user_input)
        invalid_coord_prompt
        user_input = gets.chomp.upcase.split(" ")
      end
      @player_board.place(@player_submarine, user_input)
  end

  def turn_start_message
    puts 'I have laid out my ships on the grid.'
    puts 'You now need to lay out your two ships.'
    puts 'The Cruiser is three units long and the Submarine is two units long.'
  end

  def cruiser_prompt
    puts 'Enter the squares, without commas, for the Cruiser (3 spaces):'
  end

  def submarine_prompt
    puts 'Enter the squares, without commas, for the Submarine (2 spaces):'
  end

  def invalid_coord_prompt
    puts 'Those are invalid coordinates. Please try again:'
  end

  def render_player_board
    puts @player_board.render(true)
  end

#-----------TURN

  def display_board
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    render_player_board
  end

  def result_type_player(cell)
    result_type = ''
    if cell.render == 'M'
      result_type = 'was a miss'
    elsif cell.render == 'X'
      result_type = "sunk the ship"
    elsif cell.render == 'H'
      result_type = 'was a hit'
    else
      'was an invalid coordinate. Please try again.'
    end
    puts "Your shot on #{cell.coordinate} #{result_type}"
  end

  def result_type_computer(cell)
    result_type = ''
    if cell.render == 'M'
      result_type = 'was a miss'
    elsif cell.render == 'X'
      result_type = "sunk the ship"
    elsif cell.render == 'H'
      result_type = 'was a hit'
    end
    puts "My shot on #{cell.coordinate} #{result_type}"
  end

  def player_shot
    puts 'Enter the coordinate for your shot:'
    user_input = gets.chomp.upcase
    until @computer_board.valid_coordinate?(user_input)
      if @computer_board.cells[user_input].fired_upon?
        puts "You have already fired upon #{user_input.upcase}. Please try again:"
        user_input = gets.chomp.upcase
      else
        puts 'Please enter a valid coordinate:'
        user_input = gets.chomp.upcase
      end
    end
    @computer_board.cells[user_input].fire_upon
    result_type_player(@computer_board.cells[user_input])
  end

  def computer_shot
    shuffled = @player_board.cells.keys.shuffle[5]
    require "pry"; binding.pry
    until @player_board.valid_coordinate?(shuffled)
      shuffled = @player_board.cells.keys.shuffle[5]
    end
    @player_board.cells[shuffled].fire_upon
    result_type_computer(@player_board.cells[shuffled])
  end

  def player_won_game_message
    computer_ships_sunk?
    puts 'You won!'
    puts "========================================"
  end

  def computer_won_game_message
    player_ships_sunk?
    puts 'I won!'
    puts "========================================"
  end

  def player_ships_sunk?
    @player_cruiser.sunk? && @player_submarine.sunk?
  end

  def computer_ships_sunk?
    @computer_cruiser.sunk? && @computer_submarine.sunk?
  end

  def game_over?
    player_ships_sunk? || computer_ships_sunk?
  end
end
