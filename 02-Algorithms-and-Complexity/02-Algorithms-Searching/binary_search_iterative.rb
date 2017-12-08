
def binary_search(collection, value)
  low = 0 #  low = 0
  high = collection.length - 1 #  high = length_of(collection) - 1

  while low <= high #  WHILE low <= high
  #    # #3
    mid = (low + high) / 2 #    mid = (low + high) / 2
    if collection[mid] > value #    IF collection[mid] > value THEN
      high = mid - 1 #      high = mid - 1
    elsif collection[mid] < value #    ELSE IF collection[mid] < value
      low = mid + 1 #      low = mid + 1
    else #    ELSE
      return mid #      return mid
    end #    END IF
  end #  END WHILE
  -1 #  return not_found

end

puts binary_search([0,6], 6)
puts binary_search([0,6,8,9,11], 11)
puts binary_search([0,6,8,9,11], 14)
