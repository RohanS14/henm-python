
import MDAnalysis as mda
import MDAnalysis.transformations as trans
from MDAnalysis.transformations.positionaveraging import PositionAverager

# Load in the reference structure
ref_structure = "protein_initial_unaligned.gro"
ref = mda.Universe(ref_structure)
atoms_ref_kras_bb = ref.select_atoms("name BB")

# Load in the trajectory
traj_file = "protein_bb_unaligned_pbc_fixed.trr"
mobile = mda.Universe(ref_structure, traj_file, in_memory=True)
atoms_mobile_kras_bb = mobile.select_atoms("name BB")

# Check the RMSD before alignment
mobile.trajectory[-1]  # set mobile trajectory to last frame
ref.trajectory[0]  # set reference trajectory to first frame

# Transforms:
# 1) Center on KRAS CYF B
# 2) translate up in z axes 
# 3) wrap all particles into the box 

# TODO: what's the best residue to center on
atoms_mobile_kras_CYF_bb  = mobile.select_atoms("index 250")
transforms = [trans.center_in_box(atoms_mobile_kras_CYF_bb),
              trans.translate([0,0,40]),
              trans.wrap(mobile.atoms)]
mobile.trajectory.add_transformations(*transforms)


# Alignment:
aligner = mda.analysis.align.AlignTraj(mobile, ref, select="name BB", in_memory=True).run()

with mda.Writer("mda_aligned_traj.pdb", mobile.atoms.n_atoms) as writer:
    for ts in mobile.trajectory:
        writer.write(mobile)
        
# Write average structure

# Compute average structure across all frames
N=502

aligned_traj_file = "mda_aligned_traj.pdb"
mobile_aligned = mda.Universe(aligned_traj_file)

transformation = PositionAverager(N, check_reset=True)
mobile_aligned.trajectory.add_transformations(transformation)

for ts in mobile_aligned.trajectory:
    # applies transformation across all frames
    pass

with mda.Writer("mda_struct_ave.pdb", mobile_aligned.atoms.n_atoms) as writer:
    writer.write(mobile_aligned.atoms)
