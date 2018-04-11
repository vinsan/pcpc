# Parallel  Matrix Multiplication Problem 

Project of Parallel and Concurrent Programming on the Cloud course.
Professor: Vittorio Scarano

### Problem statement

Multiplying the matrix A of size m x n by the matrix B of size n x l leads to obtaining the matrix C of size
m x l with each matrix C element.

```
// Serial algorithm of matrix multiplication
for (i=0; i<Size; i++) {
 for (j=0; j<Size; j++) {
     MatrixC[i][j] = 0;
       for (k=0; k<Size; k++) {
          MatrixC[i][j] = MatrixC[i][j] + MatrixA[i][k]*MatrixB[k][j];
   }
 }
} 
```
[!] Consider only square matrix A and B and cosider also that the size of m,n,l is dividible for the number of MPI processors.


### Benchmarking

1) Provide a solution to the problem exploiting parallel computation and develop  a C program using MPI. The provided implementation can use either Point-to-Point communication or Collective communication routines.
2) Benchmark the solution on Amazon AWS (EC2) on General Purpose instances (e.g. M3.medium family) or on Compute optimize instances (e.g. C3.large family).  Testing the solution using 1, 2, 3, 4, 5, 6, 7, 8 instances.
3) Both weak and strong scalability have to be analyzed:
- Strong Scaling: Keeping the problem size fixed and pushing in more workers or processors. Goal: Minimize time to solution for a given problem.
- Weak Scaling: Keeping the work per worker fixed and adding more workers/processors (the overall problem size increases). Goal: solve the larger problems.

###### HINT

1) The results should be presented as two different scatter x-y charts, where the x-axis denotes the number of MPI processors used and the y-axis value represents the time in milliseconds.  
2) The number of MPI processors should be equal to the number of cores.
