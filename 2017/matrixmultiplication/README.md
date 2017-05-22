# Parallel Quick Sort

Project of Parallel and Concurrent Programming on the Cloud course.

Professor: Vittorio Scarano

### Problem statement
- Given a list of numbers, we want to sort the numbers in
increasing or decreasing order.
- On a single processor the unsorted list is in its primary
memory, and at the end the same processor would contain the sorted list in its primary memory.
- Quicksort is generally recognized as the fastest sorting algorithm based on comparison of keys, in the average case.
- Quicksort has some natural concurrency.

Sequential quicksort algorithm:

- Select one of the numbers as pivot element.
- Divide the list into two sub lists: a “low list and a “high list”
- The low list and high list recursively repeat the procedure to
sort themselves.
- The final sorted result is the concatenation of the sorted low list, the pivot, and the sorted high list.

