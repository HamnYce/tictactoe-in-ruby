# frozen_string_literal: false

# board class contains all logic pertaining to the state, and behavior of the
# board. e.g. placing/updating the board
class Board
  def initialize
    @board_state = %w[--- --- ---]
    puts 'this is the board'
    print_board
  end

  def place_tic_tac(pos, tic_tac)
    # pos[0] == row, pos[1] == col
    @board_state[pos[0] - 1][pos[1] - 1] = tic_tac if index_valid_pos?(pos)
  end

  # return 3 elements
  # starting from position 0
  def to_s
    @board_state[0, 3]
  end

  def print_board
    # prints board with helpers for row and column.
    puts ' 123'
    (0..2).each do |i|
      print i + 1
      puts @board_state[i]
    end
  end

  private

  def index_valid_pos?(index)
    row = index[0].between?(1, 3)
    column = index[1].between?(1, 3)

    row && column && @board_state[index[0] - 1][index[1] - 1] == '-'
  end
end
