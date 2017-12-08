
def binary_search(collection, value, min = 0, max = collection.length-1)
  mid = get_mid(min, max)
  return mid if collection[mid] == value
  return -1 if min >= max
  collection[mid] < value ? binary_search(collection, value, mid, max) : binary_search(collection, value, min, mid)
end

def get_mid(min, max)
  mid = ((max - min)/2.0).ceil + min
end

puts binary_search([0,6], 6)
puts binary_search([0,6,8,9,11], 11)
puts binary_search([0,6,8,9,11], 14)
