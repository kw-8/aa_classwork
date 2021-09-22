require_relative "../modules/stepable.rb"
require_relative "piece"
class Pawn < Piece
  include Stepable
  def initialize(color, board, pos)
    super
    @dir = "pawn_moves"
    @symbol = "p"
  end
end