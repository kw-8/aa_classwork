require "./modules/slideable.rb"
require_relative Piece
class Rook < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "horizontal"
  end
end