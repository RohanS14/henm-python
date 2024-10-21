import filecmp

def test_enm_lammps_itp_comparison():
    enm_lammps_itp_run = 'run-pl/enm_lammps.itp'
    enm_lammps_itp_run_py = 'run-py/enm_lammps.itp'
    assert filecmp.cmp(enm_lammps_itp_run, enm_lammps_itp_run_py, shallow=False), \
        "Error: The enm_lammps.itp in 'run-pl' and 'run-py' directories are different."