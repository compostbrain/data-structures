require_relative 'node'
require "pry"
class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      root.left.nil? ? root.left = node : insert(root.left, node)
    else
      root.right.nil? ? root.right = node : insert(root.right, node)
    end
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
    if root.nil? || data.nil?
      nil
    else
      node = find(root, data)
      node.nil? ? nil : (node.title = nil && node.rating = nil)
    end
  end

  # Breadth First Search
  def print(children=nil)
    queue = [@root]
    result = []
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
    result.each {|node| puts node }
  end
end
