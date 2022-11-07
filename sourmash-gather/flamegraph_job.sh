#! /bin/bash -login

#SBATCH -D /home/baumlerc/2022-benchmark/sourmash-gather/
#SBATCH -p bmh
#SBATCH -J gather_flame
#SBATCH -t 36:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ccbaumler@ucdavis.edu
#SBATCH -o report/slurm.%j.out
#SBATCH -e report/slurm.%j.err

# activate conda
. "/home/baumlerc/miniconda3/etc/profile.d/conda.sh"

# activate sourmash env
conda activate benchmark 

#gather 
sourmash gather input/hu/SRR1976948.abundtrim.fq.gz.sig /group/ctbrowngrp/sourmash-db/gtdb-rs207/gtdb-rs207.genomic-reps.dna.k31.zip -o output/output.csv

#store process id of sourmash command as variable
PID=$!

#pyspy record
py-spy record -o svg_output/profile.svg --pid $PID
