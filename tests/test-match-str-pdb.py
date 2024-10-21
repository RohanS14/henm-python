import filecmp

# compare bondfile in the run and run-py directories

bondfile_run = '../run-pl/bondfile'
bondfile_run_py = '../run-py/bondfile'

are_files_equal = filecmp.cmp(bondfile_run, bondfile_run_py, shallow=False)

assert are_files_equal, "Error: The bondfile in 'run-pl' and 'run-py' directories are different."

# compare flucfile in the run and run-py directories

flucfile_run = '../run-pl/flucfile'
flucfile_run_py = '../run-py/flucfile'

# Compare the bondfiles
are_fluc_files_equal = filecmp.cmp(flucfile_run, flucfile_run_py, shallow=False)

assert are_fluc_files_equal, "Error: The flucfile in 'run-pl' and 'run-py' directories are different."

# compare cg1.xyz in the run and run-py directories

cg1xyz_run = '../run-pl/cg1.xyz'
cg1xyz_run_py = '../run-py/cg1.xyz'

# Compare the bondfiles
are_cg1_equal = filecmp.cmp(cg1xyz_run, cg1xyz_run_py, shallow=False)

assert are_cg1_equal, "Error: The cg files in 'run-pl' and 'run-py' directories are different."
