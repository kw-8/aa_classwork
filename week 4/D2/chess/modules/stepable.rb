module Stepable
  def moves
    # x, y
    case self.dir
    when "king"
      king_steps
    when "pawn"
      pawn_steps
    end
  end

  def king_steps
    i,j = pos
    range = [ [i-1, j-1], [i-1, j  ], [i-1, j+1],
              [i  , j-1],             [i  , j+1],
              [i+1, j-1], [i+1, j  ], [i+1, j+1] ]
    range.select{|pos| self.board[pos].is_a?(NullPiece)}
  end

  def pawn_steps
    i,j = pos
    range = [ [i-1, j-1], [i-1, j+1],
              [i+1, j-1], [i+1, j+1] ]
    range.select{|pos| self.board[pos].is_a?(NullPiece)}
  end
end