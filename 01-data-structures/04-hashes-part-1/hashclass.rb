require "pry"
class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  # setter method
  def []=(key, value)
    h_index = index(key, self.size)
    # base case 1: array is not full and keys are different:
      # set @items[h_index]
    if @items[h_index] == nil
      @items[h_index] = HashItem.new(key, value)
    # base case 2: keys and values are the same:
      # do nothing
    elsif @items[h_index].key == key && @items[h_index].value == value
      return
    # case 3: keys are the same and values are different:
      # resize array until collision fixed
    else
    
     loop do
       self.resize
      hash_index  = index(key, self.size)
       break if @items[hash_index] == nil || @items[hash_index].key == key
     end
     hash_index = index(key, self.size)

     if @items[hash_index] == nil
       @items[hash_index] = HashItem.new(key, value)

     else
       @items[hash_index].value = value
     end
   end
  end

  # getter method
  def [](key)
    h_index = index(key, @items.length)

    @items[h_index].value if @items[h_index]
  end

  def resize
    temp_hash = @items
    @items = Array.new(temp_hash.length * 2)
    temp_hash.each do |item|
      if item != nil
        new_hash_index = index(item.key, self.size)
        @items[new_hash_index] = item
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii item of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
