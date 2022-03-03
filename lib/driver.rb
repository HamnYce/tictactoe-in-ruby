# frozen_string_literal:true

require_relative 'text'
require_relative 'winner'
require_relative 'board'

# Driver class acts as glue for all the different classes.
class Driver
  include Text
  include Winner

  def initialize
    print_title
    @turn_count = 0
    init_player_names
    print_intro_dialogue
    start
  end

  # init new board, turn counter, & player names, + starts gameloop
  def start
    @board = Board.new
    game_loop
  end

  def game_loop
    turn until game_over? || @turn_count == 9

    end_game_statement(game_over?, current_player)
  end

  # use turn count to find current sign
  # repeats until correct position is received
  def turn
    @sign = @turn_count.even? ? 'X' : 'O'
    get_position
    until @board.place_tic_tac([@row, @column], @sign)
      print_error_text
      get_position
    end
    @board.print_board
    @turn_count += 1
  end

  def current_player
    @sign == 'X' ? @player_one : @player_two
  end

  def get_position
    puts "Which row do you want to place the #{@sign} in?"
    @row = gets.chomp.to_i
    puts "Which column for the #{@sign}?"
    @column = gets.chomp.to_i
  end

  def init_player_names
    puts 'decide on player 1 with a game of rock, paper, scissors!'
    puts 'player 1 what\'s your name?'
    @player_one = gets.chomp
    puts 'and player 2?'
    @player_two = gets.chomp
  end
end
