require "./modules/slideable.rb"
require_relative Piece
class King < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "king_moves"
  end
end