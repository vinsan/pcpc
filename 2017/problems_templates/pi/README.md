# Finding PI using MPI 

Project of Parallel and Concurrent Programming on the Cloud course.
Professor: Vittorio Scarano

### Problem statement

This exercise presents a simple program to determine the value of pi. The algorithm suggested here is chosen for its simplicity. The method evaluates the integral of ```4/(1+x\*x)``` between 0 and 1. 

The method is simple: the integral is approximated by a sum of n intervals; the approximation to the integral in each interval is ```(1/n)*4/(1+x\*x)```. The master process (rank 0) asks the user for the number of intervals; the master should then broadcast this number to all of the other processes. Each process then adds up every n'th interval (```x = rank/n, rank/n+size/n,...```). Finally, the sums computed by each process are added together using a reduction.

### Benchmarking

1) Provide a solution to the problem exploiting parallel computation and develop  a C program using MPI. The provided implementation can use Point-to-Point communication or Collective communication routines.
2) Benchmark the solution on Amazon AWS (EC2) on General Purpose instances (e.g. M3.medium family) or on Compute optimize instances (e.g. C3.large family).  Testing the solution using 1, 2, 4, 8, 16, 32 instances.
3) Both weak and strong scalability have to be analyzed:
- Strong Scaling: Keeping the problem size fixed and pushing in more workers or processors. Goal: Minimize time to solution for a given problem.
- Weak Scaling: Keeping the work per worker fixed and adding more workers/processors (the overall problem size increases). Goal: solve the larger problems.

###### HINT

1) The results should be proposed as two different scatter x-y charts. Where the x are the number of MPI processors used and the y value are the time in milliseconds.  
2) The number of MPI processors should be egual to the number of cores not to the number of instances.

