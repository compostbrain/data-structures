# Improve the space complexity

def poorly_written_ruby(*arrays)

  collection = arrays.flatten # use built in ruby method

  return collection if collection.length < 2
  bottom, top = [], []
 top[0] = 0
 bottom[0] = collection.size
 i = 0
 while i >= 0 do
   l = top[i]
   r = bottom[i] - 1;
   if l < r
     pivot = collection[l]
     while l < r do
       r -= 1 while (collection[r] >= pivot  && l < r)
       if (l < r)
         collection[l] = collection[r]
         l += 1
       end
       l += 1 while (collection[l] <= pivot  && l < r)
       if (l < r)
         collection[r] = collection[l]
         r -= 1
       end
     end
     collection[l] = pivot
     top[i+1] = l + 1
     bottom[i+1] = bottom[i]
     bottom[i] = l
     i += 1
   else
     i -= 1
   end
 end
 collection
end


puts poorly_written_ruby([1,2,3,4], [439,4,35],[3,4,1,0,-6])
