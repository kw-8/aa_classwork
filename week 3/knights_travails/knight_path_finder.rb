require_relative "poly_tree_node"
class KnightPathFinder
  
  def self.valid_moves(pos)
    i, j = pos
    moves = [
      [i-1, j-2], [i-1, j+2], [i+1, j-2],[i+1, j+2],
      [i-2, j-1], [i-2, j+1], [i+2, j-1],[i+2, j+1]
    ]
    moves.select { |pair| pair.all? { |ele| ele.between?(0, 7) }}
  end

  attr_reader :considered_positions, :root_node
  
  def initialize(starting_pos)
    @root_node = PolyTreeNode.new(starting_pos)
    @considered_positions = [starting_pos]
    self.build_move_tree
  end

  def new_move_positions(pos)
    new_positions = self.class.valid_moves(pos).reject do |pair|
      self.considered_positions.include?(pair)
    end

    @considered_positions += new_positions

    new_positions
  end


  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      current_node = queue.shift
      new_moves = self.new_move_positions(current_node.value)
      new_moves.each do |pos|
        child_node = PolyTreeNode.new(pos)
        child_node.parent = current_node
        queue << child_node
      end
    end
    nil
  end

  def trace_path_back(node)
    path = []

    curr_node = node

    until curr_node.nil?
      path.unshift(curr_node.value)
      curr_node = curr_node.parent
    end

    path
  end

  def find_path(end_pos);
    trace_path_back(@root_node.bfs(end_pos))
  end

end