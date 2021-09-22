require "./modules/slideable.rb"
require_relative Piece
class Bishop < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "diagonal"
  end
end