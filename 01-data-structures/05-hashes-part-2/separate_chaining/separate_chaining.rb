require_relative 'linked_list'
require "pry"
class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key, size)
    node = Node.new(key, value)
    # case 1: index is empty. Create a new LinkedList with node and
    # add it to array at index
    if @items[index] == nil
      linked_list = LinkedList.new
      linked_list.add_to_tail(node)
      @items[index] = linked_list
    # case 2: collision occurs and node is added to tail of existing
    # linked list
    else
      linked_list = @items[index]
      linked_list.add_to_tail(node)
    end
  end

  # iterate through the array to find the node with key == key
  def [](key)
    (0...size).each do |index|
      linked_list = @items[index]
      if linked_list != nil
        node = linked_list.head
        until node.next == nil || node.key == key
          node = node.next
        end
        return node.value if node.key == key
      end
    end
    nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  # number of values / number of buckets
  def load_factor
    total_nodes = 0

    (0...size).each do |index|
      linked_list = @items[index]
      if linked_list != nil
        node = linked_list.head
        if node.next == nil
          total_nodes += 1
        else
          total_nodes += 1
          until node.next == nil
            node = node.next
            total_nodes += 1
          end
        end
      end
    end

    load_factor_calculation = total_nodes.to_f / size

    if load_factor_calculation > @max_load_factor
      resize
      load_factor
    else
      load_factor_calculation
    end
  end

  # Simple method to return the number of items in the hash
  # need to check values per index
  def size
   size = @items.length
  end

  # Resize the hash
  def resize
    temp_hash = @items
    @items = Array.new(temp_hash.length * 2)
    temp_hash.each do |item|
      if item != nil
        new_hash_index = index(item.head.key, size)
        @items[new_hash_index] = item
      end
    end
  end

  # Create a function capable of printing the state of your HashClass to the console.
  # This function must present the location and value of each entry in a readily understood way.
  # This function must also print the hash’s Load Factor.
  # Use this function to verify the behavior of each HashClass after a series of insertions.

  def print
    total_nodes = 0
    (0...size).each do |index|
      linked_list = @items[index]
      if linked_list != nil
        node = linked_list.head

        if node.next == nil
          puts "Index #{index} contains:\nKey: #{node.key}\nValue: #{node.value}\n\n"
          total_nodes += 1
        else
          puts "Index #{index} contains:\n"
          total_nodes += 1
          until node.next == nil
            puts "Key: #{node.key}\n Value: #{node.value}\n"
            node = node.next
            total_nodes += 1
          end
          puts "Key: #{node.key}\n Value: #{node.value}\n\n"
        end
      end


    end
    puts "Total Nodes: #{total_nodes}\nArray Size: #{size}\nLoad Factor: #{print_load_factor}"
  end

  def print_load_factor
    total_nodes = 0

    (0...size).each do |index|
      linked_list = @items[index]
      if linked_list != nil
        node = linked_list.head
        if node.next == nil
          total_nodes += 1
        else
          total_nodes += 1
          until node.next == nil
            node = node.next
            total_nodes += 1
          end
        end
      end
    end

    load_factor_calculation = total_nodes.to_f / size
  end
end
