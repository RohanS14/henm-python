source ~/.mummi/config.mummi.sh

env | grep MUMMI

source /usr/WS1/mummiusr/mummi-spack-temp/spack/0.21/share/spack/setup-env.sh

source $MUMMI_APP/setup/setup.env.sh

echo "Setup environment complete."

echo "Loading GROMACS..."
spack load gromacs~mummi-c2
echo "Loaded GROMACS"
which gmx

export OMP_NUM_THREADS=8

echo "Aligning trajectories..."

cd run-align
python3 align_mda.py > mda.log 2>&1 

echo "Aligned trajectories, now running hENM refinement"

echo "Running perl code..."

cd ../run-pl
bash commands.dat

echo "Done, running python code..."

cd ../run-py
bash commands.dat

echo "Done"

echo "Testing..."

pytest .

echo "Finished"
