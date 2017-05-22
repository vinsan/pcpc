# PCPC
Parallel and Concurrent Programming on the Cloud -- Università degli Studi di Salerno
--------------------------------------------------------------------------------------------------
### HOMEWORKS LIST

#### 	Academic Year 2016/2017
- _gameoflife_ the Conway's Game of Life Game.
- _jacobi_	a simple Jacobi iteration.
- _matrixmultiplication_	parallel matrix multiplication.
- _nbody_	the n-body problem.
- _pi_ compute in parallel an approximation of PI.
- _wordscount_ compute the frequency of words in a set of files.
-------------------------------------------------------------------------------------------------

### How benchmark your applications on a cloud computing infrastructure? 

#### Tools to benchmark on Amazon AWS
- StraCluster toolkit use this [script](https://github.com/spagnuolocarmine/amazonhpc) to setup an Amazon EC2 cluster supporting OpenMPI
-  [Java application](https://github.com/spagnuolocarmine/aws-cluster-toolkit)  to setup an Amazon EC2 cluster supporting OpenMPI based on StarCLuster AMI

### Start EC2 instances and configure manually an MPI cluster

This EC2 instances MPI cluster machine is based on the public StarCluster AMI ami-52a0c53b available on us-east-1 AWS region.

Suppose to build a cluster of two t2.micro instances from the AWS WebConsole, you have to follow these steps:

1) Create a new key-pair and store it, suppose that the name of the key is _kcluster_.
2) Start two new t2.micro instances using the StarCluster AMI (ami-52a0c53b) and select the _kcluster_ key-pair, additionally rename it as master and slave0. Set new rule to open all port 0-65535 from anywhere in the Configure Security Group tab.
3) Connect using SSH and execute these commands on the master instance to create a new user pcpc and generate a SSH key:
```
sudo useradd -s /bin/bash -m -d /home/pcpc -g root pcpc
sudo mkdir -p /home/pcpc/.ssh
sudo chown pcpc:root ../pcpc/.ssh
sudo passwd pcpc
sudo login pcpc
ssh-keygen -t rsa
```
4) Set the SSH key for the user pcpc.
```
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
ssh localhost
```
4) Connect using SSH and execute these commands on a slave instance:
```
sudo useradd -s /bin/bash -m -d /home/pcpc -g root pcpc
sudo mkdir -p /home/pcpc/.ssh
sudo chown pcpc:root ../pcpc/.ssh
sudo passwd pcpc
sudo login pcpc
```
5) Copy from your local machine the _kcluster_ file (pem file) on the master node.
``` 
scp -i pcpkey.pem pcpkey.pem ubuntu@ec2-34-207-88-239.compute-1.amazonaws.com:
```
6) From the master node copy on each slave the files id_rsa and id_rsa.pub:
```
sudo scp -i pcpkey.pem ../pcpc/.ssh/id_rsa ubuntu@ip_slave_internal:
sudo scp -i pcpkey.pem ../pcpc/.ssh/id_rsa.pub ubuntu@ip_slave_internal:
```
7) Connect on each slave and set the owner as the pcpc user for the files id_rsa and id_rsa.pub.
```
sudo chown pcpc:root id_rsa id_rsa.pub 
```
8) Connect on each slave and move the files id_rsa and id_rsa.pub on /home/pcpc/.ssh.
```
sudo mv id_rsa id_rsa.pub /home/pcpc/.ssh
```
9) Login on each slave as pcpc user and set the SSH key.
```
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
ssh localhost
```

##### HINT

In order to add a new slave you have to repeat the steps in the range 4 and 6-9.

------------------------------------------------------------------------------------------------
## Test MPI Program

Follow these steps in order to create and test a Hello World MPI program. Consider that you are logged as pcpc user on the master node.

- Create a new MPI program
```vim hello.c```
- HelloWorld MPI program
```
#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    // Initialize the MPI environment
    MPI_Init(NULL, NULL);

    // Get the number of processes
    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    // Get the rank of the process
    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    // Get the name of the processor
    char processor_name[MPI_MAX_PROCESSOR_NAME];
    int name_len;
    MPI_Get_processor_name(processor_name, &name_len);

    // Print off a hello world message
    printf("Hello world from processor %s, rank %d"
           " out of %d processors\n",
           processor_name, world_rank, world_size);

    // Finalize the MPI environment.
    MPI_Finalize();
}
```
- Compile the MPI program 
```mpicc hello.c -o hello```
- Copy on all cluster machine the compiled program
```scp hello IP_SLAVE:```
- Run the program on the cluster
```mpirun -np 4 --host MASTER,IP_SLAVE1,IP_SLAVE2 hello```

------------------------------------------------------------------------------------------------
### Submit a solution

Each solution should be compliant with the problem project template. You can submit a solution via mail adopting the [PCPC-SOLUTION]  object to vitsca@dia.unisa.it and cspagnuolo@unisa.it. The submitted file should be a  compressed directory using tape archive.

##### Prepare your submition

In your home project directory archives your project:
```
tar -cvf solution.tar.gz *
```
Extract your project:
```
tar -xvf solution.tar.gz
```
