# Improve the space complexity

def poorly_written_ruby(*arrays)

  collection = arrays.flatten # use built in ruby method

  return collection if collection.length < 2
  left, right = [], [] # partion lists

  pivot = collection.length - 1 # default pivot is last item in collection
  pivot_value = collection[pivot] # set the pivot value

  collection = collection.slice(0, pivot)

  for item in collection
    item < pivot_value ? left.push(item) : right.push(item)
  end

  return poorly_written_ruby(left).concat([pivot_value], poorly_written_ruby(right))
end


puts poorly_written_ruby([1,2,3,4], [439,4,35],[3,4,1,0,-6])
