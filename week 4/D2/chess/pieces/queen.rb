require_relative "../modules/slideable.rb"
require_relative "Piece"
class Queen < Piece
  include Slideable
  def initialize(color, board, pos)
    super
    @dir = "both"
    @symbol = "Q"
  end
end