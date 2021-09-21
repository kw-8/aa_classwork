require 'byebug'

class PolyTreeNode
  attr_accessor :children, :value, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    if !@parent.nil?
      if !@parent.children.nil?
        @parent.children.delete(self)
      end
    end
    @parent = new_parent
    @parent.children << self unless new_parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self unless self.children.include?(child_node)
  end

  def remove_child(child_node)
    raise "not a child" unless self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?
    self.children.each do |child|
      answer = child.dfs(target_value)
      return answer unless answer.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      curr_node = queue.shift
      return curr_node if curr_node.value == target_value
      curr_node.children.each do |child|
        queue << child
      end
    end 
    nil
  end

end