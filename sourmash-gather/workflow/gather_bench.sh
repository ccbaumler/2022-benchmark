#! /bin/bash -login
#SBATCH -p bmm
#SBATCH -J gather_benchmark
#SBATCH -t 12:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=60gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sjnair@ucdavis.edu
#SBATCH -o /home/sjnair/2022-benchmark/sourmash-gather/output/reports/slurm-%j.out
#SBATCH -e /home/sjnair/2022-benchmark/sourmash-gather/output/reports/slurm-%j.err

# activate conda
. "/home/sjnair/miniconda3/etc/profile.d/conda.sh"

# activate sourmash env
conda activate base

# path variables
out_path=/home/sjnair/2022-benchmark/sourmash-gather/output
database=/group/ctbrowngrp/sourmash-db/gtdb-rs207/gtdb-rs207.genomic-reps.dna.k31.zip

# py-spy records sourmash command 
for file in *.abundtrim.fq.gz.sig
do
  echo starting $file benchmark
  py-spy record -o ${out_path}/svg_files/${file}.svg -- sourmash gather ${file} ${database} -o ${out_path}/csv_files/${file}.csv
done