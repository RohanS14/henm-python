import filecmp
import sys


def test_bondfile_comparison():
    bondfile_run = 'run-pl/bondfile'
    bondfile_run_py = 'run-py/bondfile'
    assert filecmp.cmp(bondfile_run, bondfile_run_py, shallow=False), \
        "Error: The bondfile in 'run-pl' and 'run-py' directories are different."

def test_flucfile_comparison():
    flucfile_run = 'run-pl/flucfile'
    flucfile_run_py = 'run-py/flucfile'
    assert filecmp.cmp(flucfile_run, flucfile_run_py, shallow=False), \
        "Error: The flucfile in 'run-pl' and 'run-py' directories are different."

def test_cg1_comparison():
    cg1xyz_run = 'run-pl/cg1.xyz'
    cg1xyz_run_py = 'run-py/cg1.xyz'
    assert filecmp.cmp(cg1xyz_run, cg1xyz_run_py, shallow=False), \
        "Error: The cg1.xyz files in 'run-pl' and 'run-py' directories are different."
