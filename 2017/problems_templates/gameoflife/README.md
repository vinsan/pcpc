# Conway's Game of Life

Project for the Parallel and Concurrent Programming on the Cloud course.
Professor: Vittorio Scarano

### Problem statement

The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970.
The "game" is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves, or, for advanced "players", by creating patterns with particular properties.

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead, or "populated" or "unpopulated". Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

- Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

### Benchmarking

1) Provide a solution to the problem exploiting parallel computation and develop  a C program using MPI. The provided implementation can use either Point-to-Point communication or Collective communication routines.
2) Benchmark the solution on Amazon AWS (EC2) on General Purpose instances (e.g. M3.medium family) or on Compute optimize instances (e.g. C3.large family).  Testing the solution using 1, 2, 3, 4, 5, 6, 7, 8 instances.
3) Both weak and strong scalability have to be analyzed:
- Strong Scaling: Keeping the problem size fixed and pushing in more workers or processors. Goal: Minimize time to solution for a given problem.
- Weak Scaling: Keeping the work per worker fixed and adding more workers/processors (the overall problem size increases). Goal: solve the larger problems.

###### HINT

1) The results should be presented as two different scatter x-y charts, where the x-axis denotes the number of MPI processors used and the y-axis value represents the time in milliseconds.  
2) The number of MPI processors should be equal to the number of cores.
