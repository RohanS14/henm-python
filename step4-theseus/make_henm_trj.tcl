# This is a VMD script

# Load the data (gro file and traj file)
# mol load gro pfpatch_000000001669_protein.gro trr pfpatch_000000001669_protein_aligned.trr
mol load gro protein_initial_unaligned.gro trr protein_bb_unaligned_pbc_fixed.trr

# Renaming BB (backbone) to CA (carbon alpha) for Martini
[atomselect top "name BB"] set name CA

# set sel [atomselect top "name BB"]
# Select the atoms with name CA
set sel [atomselect top "name CA"]

# writing the selected and renamed stuff to the new file
animate write pdb pfpatch_000000001669_rasraf_new_from_unaligned.pdb beg 1 end -1 waitfor all sel $sel
