require_relative "display"
require_relative "player"
class Game
  def initialize
    @board = Board.new
  end
end