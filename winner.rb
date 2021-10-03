# frozen_string_literal: true

# Module with methods to find the winner through comparisons of the different
# positions represented below.
module Winner
  # (0,0)(0,1)(0,2)
  # (1,0)(1,1)(1,2)
  # (2,0)(2,1)(2,2)
  def winner?(board)
    check_horizontal(board) or check_vertical(board) or check_diagonal(board)
  end

  def check_horizontal(board)
    x = same?(board, [0, 0], [0, 1], [0, 2])
    y = same?(board, [1, 0], [1, 1], [1, 2])
    z = same?(board, [2, 0], [2, 1], [2, 2])
    x or y or z
  end

  def check_vertical(board)
    x = same?(board, [0, 0], [1, 0], [2, 0])
    y = same?(board, [0, 1], [1, 1], [2, 1])
    z = same?(board, [0, 2], [1, 2], [2, 2])
    x or y or z
  end

  def check_diagonal(board)
    x = same?(board, [0, 0], [1, 1], [2, 2])
    y = same?(board, [2, 0], [1, 1], [0, 2])
    x or y
  end

  private

  def same?(board, pos1, pos2, pos3)
    first = board[pos1[0]][pos1[1]]
    second = board[pos2[0]][pos2[1]]
    third = board[pos3[0]][pos3[1]]

    return false if first == '-' && second == '-' && third == '-'

    xy = first == second
    xz = first == third
    xy && xz
  end
end

