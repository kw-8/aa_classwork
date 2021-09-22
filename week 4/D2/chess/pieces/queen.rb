require "./modules/slideable.rb"
require_relative Piece
class Queen < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "both"
  end
end