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

  private
  def endpoints(arr_range)
    range = []
    passed = false
    arr_range.each.with_index do |pos, i|
      if pos == self.pos
        passed = true
      elsif passed # next range
        if self.board[pos].is_a?(NullPiece)
          range << pos
        else # eating enemy is allowed
          range << pos unless self.board[pos].color == self.color
          break
        end
      else  #not yet reached self.pos; add or reset
        self.board[pos].is_a?(NullPiece) ? range << pos : range = [pos]
      end
    end
    range
  end

  def horizontal_range
    row,col = self.pos
    row = (0..7).map{|i| [row,i]}
    col = (0..7).map{|i| [i,col]}
    endpoints(row) + endpoints(col)
  end

  def diagonal_range
    left  = (0..7).map{|i| [i,i]}
    right = (0..7).map{|i| [7-i,i]}
    endpoints(left) + endpoints(right)
  end

  def both_range
    horizontal_range + diagonal_range
  end
end