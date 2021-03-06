#!/bin/bash
# This script is part of sNow! Labs training documentation.
# Visit the following URL for more information: https://github.com/hpcnow/snow-labs
# Copyright (C) 2017 Jordi Blasco
# Permission is granted to copy, distribute and/or modify this document
# under the terms of the GNU Free Documentation License, Version 1.3
# or any later version published by the Free Software Foundation;
# with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
# A copy of the license is included in the section entitled "GNU
# Free Documentation License".
#SBATCH -J ScalabilityTests
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=2G
ml intel/2017a 
######################################################################################
cp $HOME/snow-labs/user-training/examples/Cardiac_demo/mesh_mid* $SCRATCH_DIR/
cp $HOME/snow-labs/user-training/examples/Cardiac_demo/setup_mid.txt $SCRATCH_DIR/
cd $SCRATCH_DIR
srun $HOME/snow-labs/user-training/examples/Cardiac_demo/build_non-instrumented/heart_demo -m ./mesh_mid -s ./setup_mid.txt -t 50 | tee output.txt
mkdir -p $HOME/snow-labs/user-training/OUT/
echo "$SLURM_NTASKS x $SLURM_CPUS_PER_TASK : $(grep 'wall time:' output.txt)" >> $HOME/snow-labs/user-training/OUT/benchmark-results.txt
