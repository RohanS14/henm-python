import filecmp

enm_itp_run = '../run-pl/enm_lammps.itp'
enm_itp_run_py = '../run-py/enm_lammps.itp'

are_enm_files_equal = filecmp.cmp(enm_itp_run, enm_itp_run_py, shallow=False)

assert are_enm_files_equal, "Error: The temp enm.itp in 'run-pl' and 'run-py' directories are different."
