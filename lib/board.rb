# frozen_string_literal: false

# board class contains all logic pertaining to the state, and behavior of the
# board. e.g. placing/updating the board
class Board
  def initialize
    @board = %w[--- --- ---]
    puts 'this is the board'
    print_board
  end

  def place_tic_tac(pos, tic_tac)
    # pos[0] == row, pos[1] == col
    return false unless index_valid_size?(pos) && index_empty_pos?(pos)

    @board[pos[0] - 1][pos[1] - 1] = tic_tac
    true
  end

  def print_board
    # prints board with helpers for row and column.
    puts ' 123'
    (0..2).each do |i|
      print i + 1
      puts @board[i]
    end
  end

  # return 3 elements
  # starting from position 0
  def to_s
    @board[0, 3]
  end

  private

  def index_valid_size?(index)
    first = index[0].between?(1, 3)
    second = index[1].between?(1, 3)

    return true if first && second

    false
  end

  def index_empty_pos?(index)
    @board[index[0] - 1][index[1] - 1] == '-'
  end
end
