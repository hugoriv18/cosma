#!/bin/bash -l

#SBATCH --nodes=1 # Number of nodes
#SBATCH --ntasks=2 # Number of tasks
#SBATCH --tasks-per-node=2
#SBATCH -J SWIFT
#SBATCH --exclusive # No sharing of node
#SBATCH -t 24:00:00 # Time limit
#SBATCH -p cosma # Use partition (queue) cosma (this is cosma5, replace with cosma7, cosma8, etc. as appropriate)
#SBATCH -A durham # group durham for accounting purposes (use dp004/dp203 on cosma7, cosma8)
#SBATCH -o std_%j.out # Output file
#SBATCH -e stderr_%j.err # Error file
#SBATCH --mail-type=ALL # Notification when job ends (done or failed)
#SBATCH --mail-user=???? # Where to send email notifications

module purge
module load intel_comp/2018
module load intel_mpi/2018
module load parallel_hdf5/1.10.3
module load fftw/3.3.7
module load gsl/2.4

mpirun -np 2 /path/to/SWIFT/swift_mpi --self-gravity --cosmology --threads=8 -v 1 params.yml 2>&1 | tee output.log