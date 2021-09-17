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

end