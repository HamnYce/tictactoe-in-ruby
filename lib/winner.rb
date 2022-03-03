# frozen_string_literal: true

# Module with methods to find the winner through comparisons of the different
# positions represented below.
module Winner
  # (0,0)(0,1)(0,2)
  # (1,0)(1,1)(1,2)
  # (2,0)(2,1)(2,2)
  def game_over?
    check_horizontal || check_vertical || check_diagonal
  end

  def check_horizontal
    first_row = same?([0, 0], [0, 1], [0, 2])
    second_row = same?([1, 0], [1, 1], [1, 2])
    third_row = same?([2, 0], [2, 1], [2, 2])

    first_row || second_row || third_row
  end

  def check_vertical
    first_column = same?([0, 0], [1, 0], [2, 0])
    second_column = same?([0, 1], [1, 1], [2, 1])
    third_column = same?([0, 2], [1, 2], [2, 2])

    first_column || second_column || third_column
  end

  def check_diagonal
    leading_diag = same?([0, 0], [1, 1], [2, 2])
    other_diag = same?([2, 0], [1, 1], [0, 2])
    leading_diag || other_diag
  end

  def same?(pos1, pos2, pos3)
    first = @board.to_s[pos1[0]][pos1[1]]
    second = @board.to_s[pos2[0]][pos2[1]]
    third = @board.to_s[pos3[0]][pos3[1]]

    xy = first == second
    xz = second == third
    xy && xz && first != '-'
  end
end
