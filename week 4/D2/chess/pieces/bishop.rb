require "./modules/slideable.rb"

class Bishop < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "diagonal"
  end
end