require "benchmark"
require "pry"
require_relative "linked_list"


a = []
index = 0
ll = LinkedList.new

time = Benchmark.realtime do
  10_000.times do
    a.push(index)
    index += 1
  end
end

puts "Time elapsed pushing 10,000 elements into array: #{time * 1000} milliseconds"

index = 0

ll_time = Benchmark.realtime do
  10_000.times do
    node = Node.new(index)
    ll.add_to_tail(node)
    index += 1
  end
end

puts "Time elapsed adding 10,000 nodes to a linked list: #{ll_time * 1000} milliseconds"

array_access_time = Benchmark.realtime do
  puts a[4999]
end

puts "Time elapsed accessing the 5000 item in array: #{array_access_time * 1000} milliseconds"

ll_access_time = Benchmark.realtime do
  current = ll.head
  until current.next.data == 5000
    current = current.next
  end
  puts current.data
end

puts "Time elapsed accessing the 5000 item in linked list: #{ll_access_time * 1000} milliseconds"

a_removal_time = Benchmark.realtime do
  a.delete(4999)
end

puts "Time elapsed removing the 5000 item in array: #{a_removal_time * 1000} milliseconds"

ll_removal_time = Benchmark.realtime do
  node = ll.head
  until node.next.data == 5000
    node = node.next
  end
  ll.delete(node)
end

puts "Time elapsed removing the 5000 item in linked list: #{ll_removal_time * 1000} milliseconds"
