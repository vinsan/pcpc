/*
 ============================================================================
 Name        : pi.c
 Author      : Vincenzo Santoro
 Version     :
 Copyright   : copyright Vincenzo Santoro
 Description : Calculate Pi in MPI
 ============================================================================
 */
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#define SEED 35791246

int main(int argc, char *argv[]){
	int my_rank;		/* rank of process */
	int	num_procs;		/* number of processes */
	long N;
	float d;
	float d2;
	int i = 0;
	double	pi = 0.0;
	double result = 0.0;
	double x2=0.0;

	if (argc != 2) {
		N = 1E7;	//default value
	}else{
		N = atoi(argv[1]);	//user-defined value
	}

	MPI_Init(&argc, &argv);	/* start up MPI */
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);	/* find out process rank */
	MPI_Comm_size(MPI_COMM_WORLD, &num_procs);	/* find out number of processes */

	/* Tapezoid rule */
	double tapezoid_time = MPI_Wtime();
	d = 1.00/N;
	d2 = 1.00/(N*N);

	if(my_rank==num_procs-1){
		int start = (int) N/num_procs*my_rank;
		for (i=start; i<N; i+=1){
			x2=d2*i*i;
			result+=1.0/(1.0+x2);
		}
	}else{
		int start = (int) N/num_procs*my_rank;
		int end = (int) N/num_procs * (my_rank+1);
		for (i=start; i<end; i+=1){
			x2=d2*i*i;
			result+=1.0/(1.0+x2);
		}
	}

	/* combine everyone's calculations */
	double global_result;
	MPI_Reduce(&result, &global_result, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	if(my_rank==0){
		pi=4*d*global_result;
		tapezoid_time = MPI_Wtime() - tapezoid_time;
		printf("Tapezoid rule: PI is approximately %.16f\n", pi);
		if(tapezoid_time>1){
			printf("Tapezoid rule: Time spent %f seconds\n", tapezoid_time);
		}else if(tapezoid_time>60){
			printf("Tapezoid rule: Time spent %g minutes\n", tapezoid_time/60.00);
		}else
			printf("Tapezoid rule: Time spent %f milliseconds\n", tapezoid_time*1000);
	}

	/* Monte Carlo method */
	double x,y;
	int count=0; /* # of points in the 1st quadrant of unit circle */
	double z;
	double mc_pi=0.0;

	/* initialize random numbers and timer */
	srand(SEED);
	double montecarlo_time = MPI_Wtime();

	if(my_rank==num_procs-1){
		int start = (int) N/num_procs*my_rank;
		for (i=start; i<N; i+=1){
			x = (double)rand()/RAND_MAX;
			y = (double)rand()/RAND_MAX;
			z = x*x+y*y;
			if (z<=1) count++;
		}
	}else{
		int start = (int) N/num_procs*my_rank;
		int end = (int) N/num_procs * (my_rank+1);
		for (i=start; i<end; i+=1){
			x = (double)rand()/RAND_MAX;
			y = (double)rand()/RAND_MAX;
			z = x*x+y*y;
			if (z<=1) count++;
		}
	}

	/* combine everyone's calculations */
	int mc_global_result;
	MPI_Reduce(&count, &mc_global_result, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

	if(my_rank==0){
		mc_pi=(double)mc_global_result/N*4;
		montecarlo_time = MPI_Wtime() - montecarlo_time;
		printf("Monte Carlo method: # of trials= %li, estimate of pi is %.16f\n", N, mc_pi);
		if(montecarlo_time>1){
			printf("Monte Carlo method: Time spent %f seconds\n", montecarlo_time);
		}else if(montecarlo_time>60){
			printf("Monte Carlo method: Time spent %f minutes\n", montecarlo_time/60);
		}else
			printf("Monte Carlo method: Time spent %f milliseconds\n", montecarlo_time*1000);
	}

	MPI_Finalize();	/* shut down MPI */
	return 0;
}
