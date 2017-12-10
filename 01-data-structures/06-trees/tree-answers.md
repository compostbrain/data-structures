### Print Both Tree to Console:
#### Binary Search Tree:
```
[5] pry(#<BinarySearchTree>):1> print
The Matrix: 87
Braveheart: 78
Mad Max 2: The Road Warrior: 98
Pacific Rim: 72
Inception: 86
District 9: 90
Star Wars: Return of the Jedi: 80
The Shawshank Redemption: 91
The Martian: 92
Star Wars: The Empire Strikes Back: 94
Star Wars: A New Hope: 93
=> ["The Matrix: 87",

 "Braveheart: 78",
 "Mad Max 2: The Road Warrior: 98",
 "Pacific Rim: 72",
 "Inception: 86",
 "District 9: 90",
 "Star Wars: Return of the Jedi: 80",
 "The Shawshank Redemption: 91",
 "The Martian: 92",
 "Star Wars: The Empire Strikes Back: 94",
 "Star Wars: A New Hope: 93"]
 ```
#### MinHeap:
```
2] pry(#<MinBinaryHeap>):1> print
Level: 0
Pacific Rim: 72
Level: 1
Braveheart: 78
Star Wars: Return of the Jedi: 80
Level: 2
The Matrix: 87
District 9: 90
Star Wars: The Empire Strikes Back: 94
Inception: 86
Level: 3
Star Wars: A New Hope: 93
The Shawshank Redemption: 91
The Martian: 92
Mad Max 2: The Road Warrior: 98
=> ["Pacific Rim: 72",
 "Braveheart: 78",
 "Star Wars: Return of the Jedi: 80",
 "The Matrix: 87",
 "District 9: 90",
 "Star Wars: The Empire Strikes Back: 94",
 "Inception: 86",
 "Star Wars: A New Hope: 93",
 "The Shawshank Redemption: 91",
 "The Martian: 92",
 "Mad Max 2: The Road Warrior: 98"]
```

### Benchmark Results:

```
user     system      total        real
binary search tree #insert    0.310000   0.000000   0.310000 (  0.312474)
binary min heap #insert       0.290000   0.010000   0.300000 (  0.298952)
user     system      total        real
binary search tree #find      0.000000   0.000000   0.000000 (  0.000019)
binanry min heap #find        0.000000   0.000000   0.000000 (  0.000004)
user     system      total        real
tree #delete                  0.000000   0.000000   0.000000 (  0.000005)
heap #delete                  0.000000   0.000000   0.000000 (  0.000004)
[Finished in 1.096s]
```

### When to use a binary search tree:
  A binary search tree is used in many search applications when data is constantly leaving and entering.  If the tree is not balanced it can lead to poor performance similar to a linked list.

### When to use a heap:
  Heaps are typically used to model a priority que. If you need quick access to the first largest or smallest item a heap would be an excellent use case because it will always be the first item.  Insertions are fast also
