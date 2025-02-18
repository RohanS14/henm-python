
##########################
##### Run GROMACS :) #####
##########################

# TODO: change per user
cDir="/p/gpfs1/ipe1"
cd $cDir

bash run_four_gmx_jobs.sh

# this makes x1 node job (running x4 simulations) runs for 12h and x3 chained dependent jobs to start after the previous finishes (note gmx mdrun -cpi flag makes gromacs restart from last checkpoint file).

##########################
##### (: Run hENM :) #####
##########################

# consider what input/output and location
bash run-all.sh 

##########################
##### Run LAMMPS :) ######
##########################

mkdir test-lammps-integration && cd test-lammps-integration

source/usr/workspace/mummiusr/mummi-spack/spack/0.19/share/spack/setup-env.sh
spack load lammps arch=$(spack arch)
command -v lmp

source ~/.mummi/config.mummi.sh
env | grep MUMMI
source $MUMMI_APP/setup/setup.env.sh
cp $MUMMI_RESOURCES/ucg/*

source/usr/workspace/mummiusr/mummi-spack/spack/0.19/share/spack/setup-env.sh
spack load lammps arch=$(spack arch)
command -v lmp

lalloc 2 -W 30

export OMP_NUM_THREADS=8
jsrun -n1 -c1 lmp -v seed 1 -in lammps.in &

