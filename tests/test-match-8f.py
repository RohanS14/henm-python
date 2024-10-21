import filecmp

# compare bondfile in the run and run-py directories

enm_itp_run = '../run-pl/enm.itp'
enm_itp_run_py = '../run-py/enm.itp'

are_enm_files_equal = filecmp.cmp(enm_itp_run, enm_itp_run_py, shallow=False)

assert are_enm_files_equal, "Error: The enm.itp in 'run-pl' and 'run-py' directories are different."

# compare bondfile in the run and run-py directories

cgk_dat_run = '../run-pl/cgk.dat'
cgk_dat_run_py = '../run-py/cgk.dat'

are_cgk_files_equal = filecmp.cmp(cgk_dat_run, cgk_dat_run_py, shallow=False)

assert are_cgk_files_equal, "Error: The cgk.dat in 'run-pl' and 'run-py' directories are different."
