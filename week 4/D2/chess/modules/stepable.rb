module Stepable
  def moves
    # includes king, pawn, knight with fixed steps
    case self.dir
    when "king_moves"
      king_steps
    when "pawn_moves"
      pawn_steps + pawn_attack
    when "knight_moves"
      knight_steps
    end
  end

  def pawn_attack
    i,j = pos
    range = [ [i-1, j-1], [i-1, j+1],
              [i+1, j-1], [i+1, j+1] ]
    available(range)
  end

  def pawn_steps
    i,j = pos
    range = [ [i-1, j],
              [i+1, j] ]
    available(range)
  end

  private
  def available(array)
    array.select{|pos| self.board[pos].is_a?(NullPiece)}
  end

  def king_steps
    i,j = pos
    range = [ [i-1, j-1], [i-1, j  ], [i-1, j+1],
              [i  , j-1],             [i  , j+1],
              [i+1, j-1], [i+1, j  ], [i+1, j+1] ]
    available(range)
  end

  def knight_steps
    i,j = self.pos
    steps = [ [i-1, j-2], [i-1, j+2],
              [i+1, j-2], [i+1, j+2],
              [i-2, j-1], [i-2, j+1],
              [i+2, j-1], [i+2, j+1]  ]
    available(steps)
  end
end