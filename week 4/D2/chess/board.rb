require_relative "./pieces/null_piece"
require_relative "./pieces/pawn"
require_relative "./pieces/queen"
require_relative "./pieces/king"
require_relative "./pieces/bishop"
require_relative "./pieces/knight"
require_relative "./pieces/rook"
class Board
  attr_reader :grid
  def initialize
    pawn_line = Proc.new do |row, color|
      @grid[row] = (0..7).map{|col| Pawn.new(color, self, [row, col])}
    end
    back_line = Proc.new do |row, color|
      [0,7].each{|col| @grid[row][col] = Rook.new(color, self, [row, col])}
      [1,6].each{|col| @grid[row][col] = Knight.new(color, self, [row, col])}
      [2,5].each{|col| @grid[row][col] = Bishop.new(color, self, [row, col])}
      @grid[row][3] = King.new(color, self, [row, 3])
      @grid[row][4] = Queen.new(color, self, [row, 4])
    end

    @grid = Array.new(8){Array.new(8){NullPiece.instance}}
    back_line.call(0, "w")
    pawn_line.call(1, "w")
    pawn_line.call(6, "b")
    back_line.call(7, "b")
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
    # make sure to 1) move a real piece
    #              2) not eat own piece
    #              3) valid move
    raise "not a valid piece" if self[start_pos].is_a?(NullPiece)
    raise "cannot eat your own piece" if (!self[end_pos].is_a?(NullPiece) && self[end_pos].color == self[start_pos].color)
    raise "piece can't move that way" unless self[start_pos].valid_moves.include?(end_pos)

    self[start_pos].pos = end_pos
    self[end_pos].pos = nil
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
  end

  def valid_pos?(pos)
    pos.all?{|i| i.between?(0,7)}
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
    king = find_king(color) #king piece
    king.valid_moves.all?{|pos| in_check?(pos)}
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def move_piece!(color, start_pos, end_pos)
    raise "move your own piece" unless self[start_pos].color == color
    move_piece(start_pos, end_pos)
  end

  def dup
    new_board = Board.new
    (0..7).each do |row|
      (0..7).each do |col|
        new_board.grid[[row, col]] = self[[row, col]].dup
        new_board.grid[[row, col]].board = new_board
      end
    end
    new_board
  end

  def print_board
    @grid.each do |row|
      puts row.map{|pc| "#{pc.symbol}#{pc.color}"}.join(" ")
    end
  end
end
