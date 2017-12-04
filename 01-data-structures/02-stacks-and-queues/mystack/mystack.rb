class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = @stack[-1]
  end

  def pop
    top_of_stack = @stack.last
    @stack.delete(@stack.last)
    self.top = @stack[-1]
    return top_of_stack
  end

  def empty?
    if @stack == []
      return true
    else
      return false
    end
  end
end
