# Finding PI using MPI 

Project of Parallel and Concurrent Programming on the Cloud course.
Professor: Vittorio Scarano

### Problem statement

This exercise presents tow simple program to determine the value of pi. 

- Tapezoid rule. f(x)=4/(1+x^2), so PI is the integral of f(x) from 0 to 1. Then PI can be easily caculated using trapezoid rule.
 ```
#include <stdio.h>

#define N 1E7
#define d 1E-7
#define d2 1E-14

int main (int argc, char* argv[])
{
    double pi=0.0, result=0.0,x2=0.0;
		int i=0;

    for (i=0; i<N; i+=1)
    {
        x2=d2*i*i;
        result+=1.0/(1.0+x2);
    }
    
    pi=4*d*result;
    printf("PI=%lf\n", pi);
    
    return 0;
}
 ```
 
- Monte Carlo method. 

 ```
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#define SEED 35791246

int main(int argc, char** argv)
{
   int niter=0;
   double x,y;
   int i,count=0; /* # of points in the 1st quadrant of unit circle */
   double z;
   double pi;

   printf("Enter the number of iterations used to estimate pi: ");
   scanf("%d",&niter);

   /* initialize random numbers */
   srand(SEED);
   count=0;
   for ( i=0; i<niter; i++) {
      x = (double)rand()/RAND_MAX;
      y = (double)rand()/RAND_MAX;
      z = x*x+y*y;
      if (z<=1) count++;
      }
   pi=(double)count/niter*4;
   printf("# of trials= %d , estimate of pi is %g \n",niter,pi);

return 0;
}
 ```

PROVIDE A SOLUTION THAT COMPARE THE SPEEDUP AND THE PI VALUE OF THE TWO DIFFERENT METHODS.



### Benchmarking

1) Provide a solution to the problem exploiting parallel computation and develop  a C program using MPI. The provided implementation can use either Point-to-Point communication or Collective communication routines.
2) Benchmark the solution on Amazon AWS (EC2) on General Purpose instances (e.g. M3.medium family) or on Compute optimize instances (e.g. C3.large family).  Testing the solution using 1, 2, 3, 4, 5, 6, 7, 8 instances.
3) Both weak and strong scalability have to be analyzed:
- Strong Scaling: Keeping the problem size fixed and pushing in more workers or processors. Goal: Minimize time to solution for a given problem.
- Weak Scaling: Keeping the work per worker fixed and adding more workers/processors (the overall problem size increases). Goal: solve the larger problems.

###### HINT

1) The results should be presented as two different scatter x-y charts, where the x-axis denotes the number of MPI processors used and the y-axis value represents the time in milliseconds.  
2) The number of MPI processors should be equal to the number of cores.
