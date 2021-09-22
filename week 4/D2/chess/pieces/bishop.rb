require_relative "../modules/slideable.rb"
require_relative "Piece"
class Bishop < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @dir = "diagonal"
    @symbol = "b"
  end
end