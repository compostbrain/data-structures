require "benchmark"

def quick_sort(collection)
  return collection if collection.length < 2
  left, right = [], [] # partion lists

  pivot = collection.length - 1 # default pivot is last item in collection
  pivot_value = collection[pivot] # set the pivot value

  collection = collection.slice(0, pivot)

  for item in collection
    item < pivot_value ? left.push(item) : right.push(item)
  end

  return quick_sort(left).concat([pivot_value], quick_sort(right))


end


def heap_sort(collection)

  heapify(collection)

  finished = collection.size - 1

  while finished > 0
    collection[finished], collection[0] =
    collection[0], collection[finished]
    finished -= 1
    sift_down(collection, 0, finished)
  end
  collection
end

def sift_down(collection, start, finish)
  root = start

  while (root * 2) + 1 <= finish
    left_child = root * 2 + 1 # left child of the root
    right_child = left_child + 1 # right child
    swap = root # keep track of child to swap with

    swap = left_child if collection[swap] < collection[left_child]

    swap = right_child if right_child <= finish && collection[swap] < collection[right_child]

    if swap == root
      return
    else
      collection[root], collection[swap] = collection[swap], collection[root]
      root = swap
    end
  end
  collection
end

def heapify(collection)
  start =  (collection.size - 2) / 2 # last parent
  while start >= 0
    sift_down(collection, start, collection.size - 1)
    start -= 1
  end
  collection
end

def bucket_sort(array, bucket_size = 5)
  return if array.empty?

  # Determine minimum and maximum values
  min_value = array.min
  max_value = array.max

  # Initialise buckets
  bucket_count = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  # Distribute input array values into buckets
  (0..array.length - 1).each do |i|
    buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
  end

  # Sort buckets and place back into input array
  array.clear
  (0..buckets.length - 1).each do |i|
    insertion_sort buckets[i]
    buckets[i].each do |value|
      array.push(value)
    end
  end
  array
end

def insertion_sort(collection)
  sorted_collection = [collection.delete_at(0)]

  for val in collection
    sorted_collection_index = 0
    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end

      sorted_collection_index += 1
    end
  end

  sorted_collection
end

small_array = []
large_array = []
1.upto(50) { |i| small_array.push(rand(-1000..1000))}
1.upto(100_000) { |i| large_array.push(rand(-1000..1000))}

Benchmark.bm(27) do |bm|

  bm.report('#quicksort 50 items') do
    quick_sort small_array
  end
  bm.report('#quicksort 100,000 items') do
    quick_sort large_array
  end
  small_array.clear
  large_array.clear
  1.upto(50) { |i| small_array.push(rand(-1000..1000))}
  1.upto(100_000) { |i| large_array.push(rand(-1000..1000))}
  bm.report('#heapsort 50 items') do
    heap_sort small_array
  end
  bm.report('#heapsort 100,000 items') do
    heap_sort large_array
  end
  small_array.clear
  large_array.clear
  1.upto(50) { |i| small_array.push(rand(-1000..1000))}
  1.upto(100_000) { |i| large_array.push(rand(-1000..1000))}
  bm.report('#bucketsort 50 items') do
    bucket_sort small_array
  end
  bm.report('#bucketsort 100,000 items') do
    bucket_sort large_array
  end

end
