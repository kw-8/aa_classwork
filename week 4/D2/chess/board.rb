require "./pieces/piece"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8){Array.new(8){NullPiece.new}}
    [0,1,6,7].each do |row|
      @grid[row] = (0..7).map{|col| Piece.new("white", self, [row, col])}
    end
  end

  def [](pos)
    i,j = pos
    @grid[i][j]
  end
  
  def []=(pos, value)
    i,j = pos
    @grid[i][j] = value
  end

  def move_piece(start_pos, end_pos)
    raise "not valid move" if self[start_pos].nil? || !self[end_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def valid_pos?(pos)
    pos.all?{|i| i.between?(0..7)}
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

  def print_board
  end
end
