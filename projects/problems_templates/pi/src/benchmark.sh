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
#	mpirun -np "$((i*2))" --hostfile "myhostfile_$i" Pi 1073741823 >> benchmark.dat
#done

mpirun -np 1  --hostfile myhostfile_1 pi 2147483647 >> benchmark.dat
mpirun -np 2  --hostfile myhostfile_2 pi 2147483647 >> benchmark.dat
mpirun -np 3  --hostfile myhostfile_3 pi 2147483647 >> benchmark.dat
mpirun -np 4  --hostfile myhostfile_4 pi 2147483647 >> benchmark.dat
mpirun -np 5 --hostfile myhostfile_5 pi 2147483647  >> benchmark.dat
mpirun -np 6 --hostfile myhostfile_6 pi 2147483647  >> benchmark.dat
mpirun -np 7 --hostfile myhostfile_7 pi 2147483647  >> benchmark.dat
mpirun -np 8 --hostfile myhostfile_8 pi 2147483647  >> benchmark.dat


echo "Weak Scaling"
echo "Weak Scaling" >> benchmark.dat

mpirun -np 1  --hostfile myhostfile_1 pi 100000000  >> benchmark.dat
mpirun -np 2  --hostfile myhostfile_2 pi 200000000  >> benchmark.dat
mpirun -np 3  --hostfile myhostfile_3 pi 300000000  >> benchmark.dat
mpirun -np 4  --hostfile myhostfile_4 pi 400000000  >> benchmark.dat
mpirun -np 5 --hostfile myhostfile_5 pi 500000000  >> benchmark.dat
mpirun -np 6 --hostfile myhostfile_6 pi 600000000  >> benchmark.dat
mpirun -np 7 --hostfile myhostfile_7 pi 700000000  >> benchmark.dat
mpirun -np 8 --hostfile myhostfile_8 pi 800000000  >> benchmark.dat

echo "----------------------" >> benchmark.dat
