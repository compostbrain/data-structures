### All code for the three methods can be found in the `sorting_benchmarks.rb` file
### Benchmark Results:
```
#quicksort 50 items           0.000000   0.000000   0.000000 (  0.000042)
#quicksort 100,000 items      0.160000   0.010000   0.170000 (  0.172740)
#heapsort 50 items            0.000000   0.000000   0.000000 (  0.000102)
#heapsort 100,000 items       0.310000   0.000000   0.310000 (  0.317349)
#bucketsort 50 items          0.000000   0.000000   0.000000 (  0.000199)
#bucketsort 100,000 items     0.330000   0.010000   0.340000 (  0.347606)
[Finished in 1.107s]
```
### Bar Graph:

[bar graph](https://docs.google.com/spreadsheets/d/166ngY-fMvvgnYC0ZCLNKgsbgxoWpu3Ck9on38GJXtg8/edit?usp=sharing)

### Speculations on Speed of Sorting Methods

From the benchmark data generated on my computer it appears that for semi-randomly generated arrays of 50 items as well as ones of 100,000 heap sort is the quickest sorting method followed by quick sort at the smaller array size but with bucket sort at the larger array size.  The heap sort may be faster than quick sort due to the recursive implementation which in a language such as ruby is typically slower.  Both perform an in-place search. Heap sort has a worst case of O(n log n) where as quick sort has a worst case of O (n^2) although this is very rare. If the quick sort was implemented iteratively it would probably perform faster than heap sort for a typical case. Bucket sort may be performing comparatively better than quick sort at an array size of 100,000 items due to the implementation that should sort in O(n) time if no clustering of values in buckets occur. Clustering may be degrading the speed of bucket sort to some degree.  At the smaller size array the dividing into buckets has less efficiency gains above the insertion sort used which is O(n^2).

After reimplementing quick sort using an in place iterative approach it is performing significantly faster than both heap sort and bucket sort.  This shows that paying attention to the implementation of an algorithm can have a major impact on the outcome.
