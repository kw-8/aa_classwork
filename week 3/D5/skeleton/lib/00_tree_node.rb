class PolyTreeNode
  attr_accessor :children, :value, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if @parent.children == nil || !@parent.children.include?(self)
      self.parent.children.delete(self)
      @parent = node
      @parent.children << self
    end
  end
end