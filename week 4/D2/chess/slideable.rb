module Slideable
  def moves
    # horizontal, diagonal, both, knight
    case self.move_dirs
    when "horizontal"
      horizontal_range
    when "diagonal"
      diagonal_range
    when "both"
      both_range
    when "knight"
      knight_range
    end
  end

  private
  def endpoints(arr_range)
    range = []
    passed = false
    arr_range.each.with_index do |pos, i|
      if pos == self.pos
        passed = true
      elsif passed
        self.board[pos].nil? ? range << pos : break
      else  #not yet reached self.pos
        self.board[pos].nil? ? range << pos : range = []
      end
    end
  end

  def horizontal_range
    i,j = self.pos

  end

  def diagonal_range
  end

  def both_range
  end

  def knight_range
  end
end