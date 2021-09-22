require_relative Piece
require 'singleton'

class NullPiece < Piece
  extend Singleton

  attr_reader :symbol, :color
  def initialize
    @color = " "
    @symbol = " "
  end
end