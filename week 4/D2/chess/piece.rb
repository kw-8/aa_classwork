class Piece
  # include Slideable
  # include Stepable

  attr_reader :board, :color
  attr_accessor :pos, :dir
  def initialize(color, board, pos)
    @color, @board, @pos, @dir = color, board, pos, nil
  end

  def valid_moves
    self.moves
  end
end

class NullPiece < Piece
  def initialize
  end
end