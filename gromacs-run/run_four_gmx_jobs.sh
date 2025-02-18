function nk_jobid {

    output=$($*)

    echo $output | head -n1 | cut -d'<' -f2 | cut -d'>' -f1

}

jobid1=$(nk_jobid bsub -nnodes 1 -W 720 -G cancer -q pbatch ${cDir}/run_gmx.sh 12 ${cDir}/init_tf50_r1_610ns ${cDir}/init_tf50_r2_610ns ${cDir}/init_tf50_r3_310ns ${cDir}/init_tf50_r4_310ns)

jobid2=$(nk_jobid bsub -nnodes 1 -W 720 -G cancer -q pbatch -w "ended($jobid1)" ${cDir}/run_gmx.sh 12 ${cDir}/init_tf50_r1_610ns ${cDir}/init_tf50_r2_610ns ${cDir}/init_tf50_r3_310ns ${cDir}/init_tf50_r4_310ns)

jobid3=$(nk_jobid bsub -nnodes 1 -W 720 -G cancer -q pbatch -w "ended($jobid2)" ${cDir}/run_gmx.sh 12 ${cDir}/init_tf50_r1_610ns ${cDir}/init_tf50_r2_610ns ${cDir}/init_tf50_r3_310ns ${cDir}/init_tf50_r4_310ns)

jobid4=$(nk_jobid bsub -nnodes 1 -W 720 -G cancer -q pbatch -w "ended($jobid3)" ${cDir}/run_gmx.sh 12 ${cDir}/init_tf50_r1_610ns ${cDir}/init_tf50_r2_610ns ${cDir}/init_tf50_r3_310ns ${cDir}/init_tf50_r4_310ns)

# this makes x1 node job (running x4 simulations) runs for 12h and x3 chained dependent jobs to start after the previous finishes (note gmx mdrun -cpi flag makes gromacs restart from last checkpoint file).
