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

p quick_sort([5,7,2,1,46,5,78,6])
