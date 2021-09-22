require_relative "../modules/stepable.rb"
require_relative "Piece"
class Knight < Piece
  include Stepable
  def initialize(color, board, pos)
    super
    @dir = "knight_moves"
  end
end