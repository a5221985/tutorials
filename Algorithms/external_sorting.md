## External Sorting ##
1. It is a class of sorting algorithms that can handle massive amounts of data.
2. Required when data being sorted do not fit into main memory of computing device (usually RAM)
	1. Data must usually reside in slower external memory (usually hard drive)
3. Strategy:
	1. Hybrid sort-merge strategy
4. Sort:
	1. chunks of data small enough to fit in main memory are read
	2. The data is sorted
	3. Written out to temporary file
5. Merge:
	1. Sorted sub-files are combined into single larger file
6. Examples:
	1. External merge sort algorithm
		1. Sorts chunks that each fit in RAM
		2. Merges sorted chunks together
	2. Divide file in **runs**
		1. Size of each **run** is small enough to fit into main memory
	3. Sort each **run** in main memory using merge sort
	4. Merge resulting runs together into successively bigger runs until file is sorted
	5. Prerequisites for algorithm/code:
		1. MergeSort: used for sort individual runs (a run is part of file that is small enought to fit in main memory)
		2. Merge K Sorted Arrays: Used to merge sorted runs