# frozen_string_literal:true

require_relative 'menu'
require_relative 'winner'
require_relative 'board'

# high level documentation
class Driver
  # TODO: turn method too large
  # TODO: take in choice in initialise method

  include Menu
  include Winner

  def start
    @turn_count = 0
    init_player_names
    print_intro_dialogue(@player_one, @player_two)
    @board = Board.new
    game_loop
  end

  private

  def turn
    @sign = @turn_count.even? ? 'X' : 'O'

    puts "Which row do you want to place the #{@sign} in?"
    row = gets.chomp.to_i
    puts "Which column for the #{@sign}?"
    column = gets.chomp.to_i

    until @board.place_tic_tac([row, column], @sign)
      puts "\e[31minvalid input, please try again ^_^\e[0m"
      sleep 0.25
      puts '----'

      # Taking in input again
      puts "Which row do you want to place the #{@sign} in?"
      row = gets.chomp.to_i
      puts "Which column for the #{@sign}?"
      column = gets.chomp.to_i
    end

    @board.print_board

    @turn_count += 1
  end

  def init_player_names
    puts 'decide on player 1 with a game of rock, paper, scissors!'
    puts 'player 1 what\'s your name?'
    @player_one = gets.chomp
    puts 'and player 2?'
    @player_two = gets.chomp
  end

  def game_loop
    turn until winner?(@board.board)
    puts "#{@sign == 'X' ? @player_one : @player_two} is the winner!!!!"
  end

  def print_title
    print_title_screen

    choice = gets.chomp.to_i
    case choice
    when 1
      game.start
    when 2
      puts 'option 2'
    else
      puts 'thank you for trying me out'
    end
  end

end
