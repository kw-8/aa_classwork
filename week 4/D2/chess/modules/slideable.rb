module Slideable
  def moves
    # horizontal, diagonal, both
    case self.dir
    when "horizontal"
      horizontal_range
    when "diagonal"
      diagonal_range
    when "both"
      both_range
    end
  end

  # private
  def find_range(dir, pos)
    i,j = dir
    row,col = pos
    if self.board[[row + i, col + j]].color == self.color
      []
    elsif self.board[[row + i, col + j]].color == " "
      [[row + i, col + j]] + find_range(dir, [row + i, col + j])
    else  # can eat opponent
      [[row + i, col + j]]
    end
  end

  def horizontal_range
    find_range([1,0], self.pos) + find_range([0,1], self.pos)
  end

  def diagonal_range
    find_range([1,1], self.pos) + find_range([1,-1], self.pos) + find_range([-1,1], self.pos) + find_range([-1,-1], self.pos)
  end

  def both_range
    horizontal_range + diagonal_range
  end
end


  # def endpoints(arr_range)
  #   range = []
  #   passed = false
  #   arr_range.each.with_index do |pos, i|
  #     p range
  #     if pos == self.pos
  #       passed = true
  #     elsif passed # next range
  #       if self.board[pos].is_a?(NullPiece)
  #         range << pos
  #       else # eating enemy is allowed
  #         range << pos unless self.board[pos].color == self.color
  #         break
  #       end
  #     else  #not yet reached self.pos; add or reset
  #       self.board[pos].is_a?(NullPiece) ? range << pos : range = [pos]
  #     end
  #   end
  #   range
  # end