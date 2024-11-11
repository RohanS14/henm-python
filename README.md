# Multiscale Parameterization of Heterogeneous Elastic Network Models (heteroENMs)

[![Build Status](https://github.com/RohanS14/henm-python/actions/workflows/ci.yml/badge.svg)](https://github.com/RohanS14/henm-python/actions/workflows/ci.yml)

This project reimplements the automatic refinement of intramolecular interactions in Python, following the methodology described in [Lyman 2008](https://pmc.ncbi.nlm.nih.gov/articles/PMC2567941/) (Systematic Multiscale Parameterization of Heterogeneous Elastic Network Models of Proteins). The original Perl-based implementation is available [here](https://github.com/uchicago-voth/MSCG-models/tree/master/HIV_CASP1/extra_codes/henm).

## Overview
The goal of this project is to model proteins as systems of springs, refining spring constants based on data from finer-grained simulations (e.g., atomistic or coarse-grained Martini simulations). Specifically, we use this approach to refine interactions within ultra-coarse-grained (UCG) models of RAS proteins, using Martini coarse-grained (CG) trajectories as input.

## Quick Start

The CG simulations will produce two main files:
1. **GROMACS structure file:** `input-files/protein_initial_unaligned.gro`
2. **Trajectory file:** `input-files/protein_bb_unaligned_pbc_fixed.trr`

These files simulate the unaligned trajectory of the RAS protein and serve as inputs to the refinement process. To run the complete pipeline, execute the following command:

```bash
./run-all.sh
```

1. **Trajectory Alignment and Superposition**
   - **Purpose:** Aligns and superposes the CG trajectory to isolate intramolecular interactions.
   - **Script:** `run-align/align_mda.py`
   - **Output:**
     - `input-files/mda_traj_sup.pdb`: Aligned trajectory file
     - `input-files/mda_structure_ave.pdb`: Averaged structural PDB file

2. **Spring Coefficient Refinement**
   - **Scripts and their roles:**
     - `run-py/fix_enmitp.py`: Prepares initial bond and fluctuation data using the aligned structure and trajectory files (`mda_traj_sup.pdb` and `mda_structure_ave.pdb`).
     - `run-py/fluc-match-8f.py`: Refines the spring constants iteratively to match the desired interaction strength.
     - `run-py/fluc-match-str-pdb.py`: Generates the final `enm.itp` file containing the optimized spring constant data.

3. **Final Output**
   - The resulting `run-py/enm.itp` file, which contains the refined spring constants, can be used to run UCG simulations in LAMMPS.
