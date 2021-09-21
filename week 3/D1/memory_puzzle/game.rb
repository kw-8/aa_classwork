require_relative "Board"
require_relative "Card"
require_relative "human_player"
class Game

  def initialize(size)
    @board = Board.new(size)
    @board.populate
    @player = HumanPlayer.new
  end

  def play
    @board.board_print
    previous_guess = @player.get_input
    until @board.won? # ["1","3"]
      guess_position_2 = @player.get_input
      
      if @board.reveal(previous_guess) == @board.reveal(guess_position_2)
        @board[previous_guess].face_up = true
        @board[guess_position_2].face_up = true
        puts "Match! #{@board[previous_guess].face}"
      else
        puts "Click another card!"
      end
      @board.render
      @board.board_print
      previous_guess = guess_position_2
    end
    puts "You win!"
  end
end

g = Game.new(2)
g.play