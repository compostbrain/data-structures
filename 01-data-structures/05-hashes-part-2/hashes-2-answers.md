## Results of Print function
```
irb(main):008:0> star_wars_movies.print
Index 0 contains:
Key Star Wars: The Phantom Menace
Value: Number One
Index 2 contains:
Key Star Wars: The Empire Strikes Back
Value: Number Five

Index 3 contains:
Key: Star Wars: Attack of the Clones
 Value: Number Two
Key: Star Wars: Return of the Jedi
 Value: Number Six
Index 4 contains:
Key Star Wars: A New Hope
Value: Number Four
Index 5 contains:
Key Star Wars: Revenge of the Sith
Value: Number Three
Total Nodes: 6
Array Size: 6
Load Factor: 1.0
=> nil
irb(main):009:0>
```

## Three Different Collision Resolution Strategies

One alternate collision resolution strategy is called coalesced hashing.  This is a hybrid of chaining and opening addressing.  It similar to separate chaining but instead of new for the linked list, buckets in the table are used.  This  strategy avoids the effects of clustering and can take advantage of efficient search algorithms.

A second  approach is called hopscotch hashing.  This combines cuckoo hashing and linear probing and works very well with large load factors.  It works by defining neighborhoods of buckets near the origin hash bucket, where a given entry is found.  When a new item is added to the hash the algorithm first attempts to add it the defined neighborhood.  If all buckets in that neighborhood are full then buckets are traversed in sequence as in a linear probing.

A third strategy is 2-choice-hashing in which two different hash functions generating two different indexes are used and a new item is placed at the index with the fewest objects.

## A New Collision Resolution Strategy

In my new strategy when a collision occurs instead of resizing the array, a new array would be created at that index with the existing and new node being added using next empty index algorithm.
