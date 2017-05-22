# PCPC
Parallel and Concurrent Programming on the Cloud -- Università degli Studi di Salerno

### HOMEWORKKS

#### 2017 
### MPI CLuster Setup

- _gameoflife_ the Conway's Game of Life Game
- _jacobi_	a simple Jacobi iteration
- _matrixmultiplication_	parallel matrix multiplication
- _nbody_	the n-body problem
- _pi_ compute in parallel an approximation of PI
- _wordscount_ compute the frequency of words in a set of files

### Benchmarking

#### Tools to benchmark on Amazon AWS
- StraCluster toolkit use this [script](https://github.com/spagnuolocarmine/amazonhpc) to setup an Amazon EC2 cluster supporting OpenMPI
-  [Java application](https://github.com/spagnuolocarmine/aws-cluster-toolkit)  to setup an Amazon EC2 cluster supporting OpenMPI based on StarCLuster AMI

### Start EC2 instances and configure manually an MPI cluster

This EC2 instances MPI cluster machine is based on the public StarCluster AMI ami-52a0c53b available on us-east-1 AWS region.

Suppose to build a cluster of two t2.micro instances from the AWS WebConsole, you have to follow these steps:

1) 

