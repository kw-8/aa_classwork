class Piece
  attr_reader :board, :color, :dir
  attr_accessor :pos
  def initialize(color, board, pos)
    @color, @board, @pos, @dir = color, board, pos, nil
  end

  def valid_moves # returns moves that are valid
    self.moves.select{|pos| self.board.valid_pos?(pos)}
  end

  private
  def moves
    "moves has not been set for this class"
  end
end
