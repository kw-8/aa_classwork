module Slideable
  def moves
    # horizontal, diagonal, both, knight
    case self.dir
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
      elsif passed #add until first piece
        self.board[pos].is_a?(NullPiece) ? range << pos : break
      else  #not yet reached self.pos; add or reset
        self.board[pos].is_a?(NullPiece) ? range << pos : range = []
      end
    end
    range
  end

  def horizontal_range
    i,j = self.pos
    row = (0..7).map{|idx| [i,idx]}
    col = (0..7).map{|idx| [idx,j]}
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

  def knight_range
    i,j = self.pos
    all_spots = [ [i-1, j-2], [i-1, j+2],
                  [i+1, j-2], [i+1, j+2],
                  [i-2, j-1], [i-2, j+1],
                  [i+2, j-1], [i+2, j+1]  ]
    all_spots.select{|pos| self.board[pos].is_a?(NullPiece)}
  end
end