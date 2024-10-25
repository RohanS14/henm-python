import MDAnalysis as mda
from MDAnalysis.core.groups import AtomGroup

### This part is make_hemn_trj.tcl

# Load the GRO topology and TRR trajectory into MDAnalysis
u = mda.Universe('pfpatch_000000001669_protein.gro', 'pfpatch_000000001669_protein_aligned.trr')

# Select atoms with name 'BB' (for backbone in Martini)
bb_atoms = u.select_atoms("name BB")

# Rename BB to CA (MDAnalysis doesn't directly support renaming, so we update atom names temporarily)
# We will update atom names in the AtomGroup and save the selection as a new file.
bb_atoms.names = ['CA'] * len(bb_atoms)  # Set all selected atom names to 'CA'

# Now select the renamed atoms (now 'CA')
ca_atoms = u.select_atoms("name CA")

# Write out the selection to a new PDB file across all frames
with mda.Writer("pfpatch_000000001669_rasraf_new.pdb", ca_atoms.n_atoms) as pdb:
    for ts in u.trajectory:
        pdb.write(ca_atoms)
