require_relative "../modules/slideable.rb"
require_relative "Piece"
class Rook < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @dir = "horizontal"
  end
end