require "./modules/slideable.rb"
require_relative Piece
class Pawn < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "pawn_moves"
  end
end