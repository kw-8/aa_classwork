require "./modules/slideable.rb"

class Rook
  extend Slideable
  def initialize(color, board, pos)
    super
    @dir = "horizontal"
  end
end