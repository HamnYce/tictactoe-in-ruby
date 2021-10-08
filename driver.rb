# frozen_string_literal:true

require_relative 'menu'
require_relative 'winner'
require_relative 'board'

# Driver class acts as glue for all the different classes.
class Driver

  include Menu
  include Winner

  def initialize
    print_title
    start
  end

  # init new board, turn counter, & player names, + starts gameloop
  def start
    @turn_count = 0
    init_player_names
    print_intro_dialogue
    @board = Board.new
    game_loop
  end

  private

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

  def init_player_names
    puts 'decide on player 1 with a game of rock, paper, scissors!'
    puts 'player 1 what\'s your name?'
    @player_one = gets.chomp
    puts 'and player 2?'
    @player_two = gets.chomp
  end

  def game_loop
    turn until winner?(@board.to_s) || @turn_count == 9
    unless winner?(@board.to_s)
      puts 'Game ended in a draw ^^'
      return
    end
    puts "#{@sign == 'X' ? @player_one : @player_two} is the winner!!!!"
  end

  def print_error_text
    puts "\e[31minvalid input, please try again ^_^\e[0m"
    sleep 0.25
    puts '----'
  end

  def get_position
    puts "Which row do you want to place the #{@sign} in?"
    @row = gets.chomp.to_i
    puts "Which column for the #{@sign}?"
    @column = gets.chomp.to_i
  end
end
