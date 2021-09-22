require "./modules/slideable.rb"
require_relative Piece
class Knight < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "knight_moves"
  end
end