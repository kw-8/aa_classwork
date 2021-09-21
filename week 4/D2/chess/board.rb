require_relative "piece"
class Board
  def initialize
    @grid = Array.new(8){Array.new(8)}
    [0,1,6,7].each{|row| @grid[row] = Array.new(8){Piece.new}}
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
end
