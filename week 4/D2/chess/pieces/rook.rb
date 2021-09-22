require_relative "../modules/slideable.rb"
require_relative "Piece"
class Rook < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @dir = "horizontal"
    @symbol = "r"
  end
end