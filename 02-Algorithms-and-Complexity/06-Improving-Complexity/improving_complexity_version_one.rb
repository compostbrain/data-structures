# code optimizations


# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)

  combined_array = arrays.flatten # use built in ruby method

  index_count = combined_array.size - 1 # assign a variable so that array does not need to be accessed in while loop check
  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    i = 0
    while i <= index_count # use variable to avoid array access

      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end


puts poorly_written_ruby([1,2,3,4], [439,4,35],[3,4,1,0,-6])
