# improve time complexity

def poorly_written_ruby(*arrays)

  collection = arrays.flatten # use built in ruby method
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = poorly_written_ruby(collection[0..mid - 1])
    right = poorly_written_ruby(collection[mid..collection.length])

    merge(left, right)
  end

end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first

    [left.first] + merge(left[1..left.length], right)
  else

    [right.first] + merge(left, right[1..right.length])
  end
end
puts poorly_written_ruby([1,2,3,4], [439,4,35],[3,4,1,0,-6])
