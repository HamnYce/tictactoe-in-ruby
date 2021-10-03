# frozen_string_literal:true

require_relative 'menu'
require_relative 'winner'
require_relative 'board'

# high level documentation
class Driver


  include Menu
  include Winner

  def start
    @turn_count = 0
    print_title_screen
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

    @board.place_tic_tac([row, column], @sign)

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
end
