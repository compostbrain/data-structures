require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end



  def []=(key, value)
    node_index = index(key, size)
    # base case 1: array is not full and keys are different:
      # set @items[node_index]
    if @items[node_index] == nil
      @items[node_index] = Node.new(key, value)
    # base case 2: keys and values are the same:
      # do nothing
    elsif @items[node_index].key == key && @items[node_index].value == value
      return
    # case 3: keys are the same and values are different:
      # find next_open_index or if none resize
    elsif next_open_index(node_index) != -1
      node_index = next_open_index(node_index)
      @items[node_index] = Node.new(key, value)
    else
      loop do
        resize
        node_index = index(key, size)
        break if @items[node_index] == nil || @items[node_index].key == key
      end
      if @items[node_index] == nil
       @items[node_index] = Node.new(key, value)
      else
        @items[node_index].value = value
      end
    end
  end

 # need to account for if there was a collision and node was moved to another index
  def [](key)
    (0...size).each do |i|
      if @items[i] != nil && @items[i].key == key
        return @items[i].value
      end
    end
  end
  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  # start at @items[index+1]
  def next_open_index(index)
    i = index + 1
    if i >= size
      -1
    else
      while i < size && @items[i] != nil
        i += 1
      end
      if @items[i] == nil
        i
      else
        -1
      end
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp_hash = @items
    @items = Array.new(temp_hash.length * 2)
    temp_hash.each do |item|
      if item != nil
        new_hash_index = index(item.key, size)
        @items[new_hash_index] = item
      end
    end
  end
end
