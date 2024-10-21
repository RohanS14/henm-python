import filecmp

def test_enm_itp_comparison():
    enm_itp_run = 'run-pl/enm.itp'
    enm_itp_run_py = 'run-py/enm.itp'
    assert filecmp.cmp(enm_itp_run, enm_itp_run_py, shallow=False), \
        "Error: The enm.itp in 'run-pl' and 'run-py' directories are different."

def test_cgk_dat_comparison():
    cgk_dat_run = 'run-pl/cgk.dat'
    cgk_dat_run_py = 'run-py/cgk.dat'
    assert filecmp.cmp(cgk_dat_run, cgk_dat_run_py, shallow=False), \
        "Error: The cgk.dat in 'run-pl' and 'run-py' directories are different."
