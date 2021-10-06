# frozen_string_literal: false

# board class contains all logic pertaining to the state, and behavior of the
# board. e.g. placing/updating the board
class Board
  def initialize
    @board = %w[123 --- --- ---]
    puts 'this is the board'
    print_board
  end

  def place_tic_tac(pos, tic_tac)
    # pos[0] == row, pos[1] == col
    return false unless index_valid_size?(pos) && index_valid_pos?(pos)

    @board[pos[0]][pos[1] - 1] = tic_tac
    true
  end

  def print_board
    puts ' 123'
    (1..3).each do |i|
      print i
      puts @board[i]
    end
  end

  def board
    @board[1, 3]
  end

  private

  def index_valid_size?(index)
    first = index[0].between?(1, 3)
    second = index[1].between?(1, 3)

    return true if first && second

    false
  end

  def index_valid_pos?(index)
    @board[index[0]][index[1] - 1] == '-'
  end
end
