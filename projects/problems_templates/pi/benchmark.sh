# bash

date >> benchmark.dat 

#loading list of private ip and making the hostfiles
. ip_private_list.array

for (( i=1; i<=${#ip_private_list[@]}; i++ ))
do
	for each in "${ip_private_list[@]:0:$i}"
	do
	  echo $each >> "myhostfile_$i"
	done
done

#start banchmark

echo "Strong Scaling"
echo "Strong Scaling" >> benchmark.dat

#for (( i=1; i<=${#ip_private_list[@]}; i++ ))
#do
#	mpirun -np "$((i*2))" --hostfile "myhostfile_$i" JacobiPar 4802 data/jacobi_12802x12802.dat >> benchmark.dat
#done

mpirun -np 1  --hostfile myhostfile_1 Pi 2147483647 >> benchmark.dat
mpirun -np 2  --hostfile myhostfile_2 Pi 2147483647 >> benchmark.dat
mpirun -np 3  --hostfile myhostfile_3 Pi 2147483647 >> benchmark.dat
mpirun -np 4  --hostfile myhostfile_4 Pi 2147483647 >> benchmark.dat
mpirun -np 5 --hostfile myhostfile_5 Pi 2147483647  >> benchmark.dat
mpirun -np 6 --hostfile myhostfile_6 Pi 2147483647  >> benchmark.dat
mpirun -np 7 --hostfile myhostfile_7 Pi 2147483647  >> benchmark.dat
mpirun -np 8 --hostfile myhostfile_8 Pi 2147483647  >> benchmark.dat


echo "Weak Scaling"
echo "Weak Scaling" >> benchmark.dat

mpirun -np 1  --hostfile myhostfile_1 Pi 100000000  >> benchmark.dat
mpirun -np 2  --hostfile myhostfile_2 Pi 200000000  >> benchmark.dat
mpirun -np 3  --hostfile myhostfile_3 Pi 300000000  >> benchmark.dat
mpirun -np 4  --hostfile myhostfile_4 Pi 400000000  >> benchmark.dat
mpirun -np 5 --hostfile myhostfile_5 Pi 500000000  >> benchmark.dat
mpirun -np 6 --hostfile myhostfile_6 Pi 600000000  >> benchmark.dat
mpirun -np 7 --hostfile myhostfile_7 Pi 700000000  >> benchmark.dat
mpirun -np 8 --hostfile myhostfile_8 Pi 800000000  >> benchmark.dat

echo "----------------------" >> benchmark.dat
