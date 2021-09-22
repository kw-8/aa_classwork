require "./modules/slideable.rb"

class Queen < Piece
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "both"
  end
end