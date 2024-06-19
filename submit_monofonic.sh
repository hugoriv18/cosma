#!/bin/bash -l

#SBATCH --nodes=1 # Number of nodes
#SBATCH --ntasks=4 # Number of tasks
#SBATCH --tasks-per-node=4
#SBATCH -J Monofonic
#SBATCH --exclusive # No sharing of node
#SBATCH -t 6:00:00 # Time limit
#SBATCH -p cosma # Use partition (queue) cosma (this is cosma5, replace with cosma7, cosma8, etc. as appropriate)
#SBATCH -A durham # group durham for accounting purposes (use dp004/dp203 on cosma7, cosma8)
#SBATCH -o std_%j.out # Output file
#SBATCH -e stderr_%j.err # Error file
#SBATCH --mail-type=ALL # Notification when job ends (done or failed)
#SBATCH --mail-user=hugorivera@estudiantes.fisica.unam.mx # Where to send email notifications

module purge
module load gnu_comp/7.3.0
module load openmpi/3.0.1
module load parallel_hdf5/1.10.3
module load fftw/3.3.7
module load gsl/2.4
module load cmake/3.11.4

mpirun -np 4 /cosma/home/durham/dc-rive1/monofonic gen.conf
