### All code for the three methods can be found in the `sorting_benchmarks.rb` file
### Benchmark Results:
```
                      user     system      total        real
#quicksort 50 items           0.000000   0.000000   0.000000 (  0.000093)
#quicksort 100,000 items      0.440000   0.020000   0.460000 (  0.451422)
#heapsort 50 items            0.000000   0.000000   0.000000 (  0.000050)
#heapsort 100,000 items       0.260000   0.000000   0.260000 (  0.269919)
#bucketsort 50 items          0.000000   0.000000   0.000000 (  0.000418)
#bucketsort 100,000 items     0.690000   0.000000   0.690000 (  0.687810)
```
### Bar Graph:

[bar graph](https://docs.google.com/spreadsheets/d/166ngY-fMvvgnYC0ZCLNKgsbgxoWpu3Ck9on38GJXtg8/edit?usp=sharing)

### Speculations on Speed of Sorting Methods

From the benchmark data generated on my computer it appears that for semi-randomly generated arrays of 50 items as well as ones of 100,000 heap sort is the quickest sorting method followed by quick sort at the smaller array size but with bucket sort at the larger array size.  The heap sort may be faster than quick sort due to the recursive implementation which in a language such as ruby is typically slower.  Both perform an in-place search. Heap sort has a worst case of O(n log n) where as quick sort has a worst case of O (n^2) although this is very rare. If the quick sort was implemented iteratively it would probably perform faster than heap sort for a typical case. Bucket sort may be performing comparatively better than quick sort at an array size of 100,000 items due to the implementation that should sort in O(n) time if no clustering of values in buckets occur. Clustering may be degrading the speed of bucket sort to some degree.  At the smaller size array the dividing into buckets has less efficiency gains above the insertion sort used which is O(n^2).
