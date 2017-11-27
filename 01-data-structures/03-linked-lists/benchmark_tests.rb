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
  binding.pry
end

puts "Time elapsed adding 10,000 nodes to a linked list: #{ll_time * 1000} milliseconds"

array_access_time = Benchmark.realtime do
  puts a[4999]
end

puts "Time elapsed accessing the 5000 item in array: #{array_access_time * 1000} milliseconds"

ll_access_time = Benchmark.realtime do
  binding.pry
  current = ll.head
  until current.next == 4999
    current = current.next
  end
  puts current.data
end

puts "Time elapsed accessing the 5000 item in linked list: #{ll_access_time * 1000} milliseconds"
