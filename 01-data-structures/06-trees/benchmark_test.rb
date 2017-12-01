require "benchmark"
require_relative "binary_heap/min_binary_heap"
require_relative "binary_tree/binary_search_tree.rb"

iterations = 100_000
tree_root = Node.new("root", 1)
tree = BinarySearchTree.new(tree_root)
heap_root = Node.new("heap root", 1)
heap = MinBinaryHeap.new(heap_root)


Benchmark.bm(27) do |bm|
  # insertion
  bm.report("insert in binary search tree") do
    iterations.times do |i|
      new_node = Node.new(i, rand(100000))
      tree.insert(tree_root, new_node)
    end
  end


end
