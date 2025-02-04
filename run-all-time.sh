echo "Starting job" >> timing.txt

source ~/.mummi/config.mummi.sh

env | grep MUMMI

source /usr/WS1/mummiusr/mummi-spack-temp/spack/0.21/share/spack/setup-env.sh

source $MUMMI_APP/setup/setup.env.sh

echo "Setup environment complete." >> timing.txt

echo "Loading GROMACS..."
spack load gromacs~mummi-c2
echo "Loaded GROMACS" >> timing.txt
which gmx

export OMP_NUM_THREADS=8

echo "Aligning trajectories..." >> timing.txt

cd run-align
(time python3 align_mda.py > mda.log 2>&1 ) 2>> ../timing.txt
echo "" >> ../timing.txt

echo "Aligned trajectories, now running hENM refinement"

echo "Running perl code..." >> ../timing.txt

cd ../run-pl
(time bash commands.dat) 2>> ../timing.txt
echo "" >> ../timing.txt

echo "Done, running python code..." >> ../timing.txt

cd ../run-py
(time bash commands.dat) 2>> ../timing.txt
echo "" >> ../timing.txt

cd ../lammps-input
python3 get_data.py lammpsdata.dat
python3 get_bond_coeff.py lammpsbondcoeff.dat

echo "Done" >> ../timing.txt

echo "Testing..."

cd ..
pytest .

deactivate

echo "Finished"