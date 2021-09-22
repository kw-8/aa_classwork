require_relative "../modules/stepable.rb"
require_relative "Piece"
class King < Piece
  include Stepable
  def initialize(color, board, pos)
    super
    @dir = "king_moves"
  end
end