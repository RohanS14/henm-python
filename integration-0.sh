
##########################
##### Run GROMACS :) #####
##########################

# TODO: change per user
cDir="/p/gpfs1/ipe1/integration"
cd $cDir

DIR="gmx-int"
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    echo "Directory '$DIR' created."
else
    echo "Directory '$DIR' already exists."
fi

cd $DIR
bash ../run_four_gmx_jobs.sh

# this makes x1 node job (running x4 simulations) runs for 12h and x3 chained dependent jobs to start after the previous finishes (note gmx mdrun -cpi flag makes gromacs restart from last checkpoint file).

##########################
##### (: Run hENM :) #####
##########################

DIR="henm-int"
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    echo "Directory '$DIR' created."
else
    echo "Directory '$DIR' already exists."
fi

cd $DIR
# consider what input/output and location
bash ../run-henm.sh

##########################
##### Run LAMMPS :) ######
##########################

DIR="lammps-int"
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    echo "Directory '$DIR' created."
else
    echo "Directory '$DIR' already exists."
fi

# copy henm output to new folder to use instead of mummi-resources/ucg/*
cp lammps-input/lammps* lammps-int
cp $MUMMI_RESOURCES/ucg/lammps.in
cd $DIR

# source spack & load lammps
source /usr/workspace/mummiusr/mummi-spack/spack/0.19/share/spack/setup-env.sh
spack load lammps arch=$(spack arch)
command -v lmp

# source mummi
source ~/.mummi/config.mummi.sh
env | grep MUMMI
# cp lammps-int/* .

# create and run job
lalloc 2 -W 30
export OMP_NUM_THREADS=8
jsrun -n1 -c1 lmp -v seed 1 -in lammps.in &

# Each LAMMPS will write a trajectory file named ucg.traj.xyz
wait