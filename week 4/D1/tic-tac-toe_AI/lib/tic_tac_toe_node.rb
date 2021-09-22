require 'byebug'
require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []
    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row,col]
        if self.board.empty?(pos)
          new_board = self.board.dup
          new_board[pos] = next_mover_mark 
          next_mark = self.next_mover_mark == :x ? :o : :x
          children_arr << self.class.new(new_board, next_mark ,pos)
        end
      end
    end
    children_arr
  end

  def losing_node?(evaluator)
    # debugger
    return true if self.board.won? && evaluator == self.next_mover_mark
    return false if self.board.tied?
    return false if self.board.won? && evaluator != self.next_mover_mark
    
    other_mark = evaluator == :x ? :o : :x
    if self.next_mover_mark != evaluator#player's turn
      self.children.all? { |child| child.losing_node?(other_mark) }
    else #opponents
      self.children.any? { |child| child.losing_node?(other_mark) }
    end
  end  
end
