cd run-align
python3 align_mda.py

echo "Aligned trajectories, running hENM refinement"

cd ../run-pl
bash commands.dat

echo "Done"