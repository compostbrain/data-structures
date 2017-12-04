require "benchmark"
require "pry"
require_relative "min_heap/min_binary_heap"
require_relative "binary_tree/binary_search_tree.rb"

iterations = 100_000

tree_root = Node.new("root", 1)
tree = BinarySearchTree.new(tree_root)

heap_root = HeapNode.new("heap root", 1)
heap = MinBinaryHeap.new(heap_root)

Benchmark.bm(27) do |bm|
  bm.report("binary search tree #insert") do
    iterations.times do |i|
      new_node = Node.new(i, rand(100000))
      tree.insert(tree_root, new_node)
    end
  end
  bm.report("binary min heap #insert") do
    iterations.times do |i|
      new_node = HeapNode.new(i, rand(100000))
      tree.insert(heap_root, new_node)
    end
  end
end

target_node = Node.new("target", 50_000)
tree.insert(tree_root, target_node)

target_heap_node = HeapNode.new("target", 50_000)
heap.insert(heap_root, target_heap_node)

Benchmark.bm(27) do |bm|
  bm.report("binary search tree #find") do
    tree.find(tree_root, "target")
  end
  bm.report("binanry min heap #find") do
    heap.find(heap_root, "target")
  end
end

Benchmark.bm(27) do |bm|
  bm.report("tree #delete") do
    tree.delete(tree_root, "target")
  end
  bm.report("heap #delete") do
    heap.delete(heap_root, "target")
  end
end
