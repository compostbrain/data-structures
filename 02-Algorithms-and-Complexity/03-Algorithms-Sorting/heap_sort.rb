
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


# iParent(i)     = floor((i-1) / 2) where floor functions map a real number to the smallest leading integer.
#   iLeftChild(i)  = 2*i + 1
#   iRightChild(i) = 2*i + 2
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

p heap_sort([5,7,-2,1,46,5,78,0])
p heap_sort [71,4]
p heap_sort [71]
