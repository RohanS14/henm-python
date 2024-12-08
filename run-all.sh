cd run-align
python3 align_mda.py

echo "Aligned trajectories, running hENM refinement"

echo "Running Perl code"

cd ../run-pl
bash commands.dat

echo "Running Python code"

cd ../run-py
bash commands.dat

echo "Done"