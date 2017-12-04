require_relative 'heap_node'

class MinBinaryHeap

  attr_reader :root

  def initialize(root)
    @root = root
    @node_count = 1  # this variable keeps track of the last node's position
  end

  def insert(root, node)

    @node_count += 1
    parent = root
    path = find_node_path(@node_count) # find the path to node postion
    # traverse heap to first open node position
    until path.size == 1
      if path.pop == "left"
        parent = parent.left
      else
        parent = parent.right
      end
    end
    # insert node at the end of the heap
    if path.pop == "left"
      parent.left = node
      node.parent = parent
    else
      parent.right = node
      node.parent = parent
    end
    # satisfy heap property
    sift_up(node)
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil?
      nil
    else
      if root.title == data
        root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    # swap node to be deleted with last node
    # if deleting the root make root = swapped node
    # delete last node, @node_count -= 1
    # then sift_down
    if root.nil? || data.nil?
      nil
    else
      @node_count -= 1

      node = find(root, data)
      if @node_count == 1
        node.title = nil
        node.rating = nil
        node = nil
        return
      end
      path = find_node_path(@node_count)

      if node.nil?
        nil
      else
        # traverse heap to last exisiting node position
        until path.size == 1
          if path.pop == "left"
            parent = parent.left
          else
            parent = parent.right
          end
        end
        # swap node to be deleted with last node
        path.pop == "left" ? last_node = parent.left : last_node = parent.right

        swap(last_node, node)
        # delete last node
        node.title = nil
        node.rating = nil
        node = nil
        if last_node.parent.nil? || last_node.value > last_node.parent.value
          sift_down(last_node)
        else
          sift_up(last_node)
        end

      end
    end
  end

  def print
    #traverse tree printing title and value
    queue = [@root]
    result = []
    level = -1
    while queue.size > 0
      new_root = queue.shift
      if new_root.left != nil
        queue.push(new_root.left)
      end
      if new_root.right != nil
        queue.push(new_root.right)
      end
      result.push("#{new_root.title}: #{new_root.rating}")
    end
    result.each_with_index do |node, index|
      current_level = (Math.log(index + 1) / Math.log(2)).floor
      if level < current_level
        level += 1
        puts "Level: #{level}"
      end
      puts node
    end
  end

  private

  def find_node_path(n)
    path = [] # stack path
    current_node = n
    while current_node > 1
      if current_node % 2 == 1 # if node is odd it is a right child
        path.push("right")
      else # otherwise it is even and a left child
        path.push("left")
      end
      current_node = (current_node / 2).floor # set the current node to parent
    end
    return path # stack now contains path to node n
  end

  def swap(parent, node)
    parent.rating, node.rating = node.rating, parent.rating
    parent.title, node.title = node.title, parent.title
  end

  def sift_up(node)
    if node.parent.nil?
      @root = node
      return
    elsif node.parent.rating < node.rating
      return
    else
      swap(node.parent, node)
      sift_up(node.parent)
    end
  end

  def sift_down(node)
    # compare with all children
    if !node.left.nil? && !node.right.nil?
    left_child_value = node.left.rating
    right_child_value = node.right.rating
      if node.value > left_child_value || node.value > right_child_value
        left_child_value < right_child_value ? smallest_child = node.left : smallest_child = node.right
        swap(node, smallest_child)
        sift_down(smallest_child)
      else
        return
      end
    elsif !node.left.nil? && node.value > node.left.value
      swap(node, node.left)
    end

  end
end
