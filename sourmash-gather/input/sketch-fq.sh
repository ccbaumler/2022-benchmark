#! /bin/bash -login


#SBATCH -D /home/baumlerc/2022-benchmark/sourmash-gather/input
#SBATCH -p bmm
#SBATCH -J sketch
#SBATCH -t 6:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=10gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ccbaumler@ucdavis.edu
#SBATCH -o reports/slurm.%j.sketch.out
#SBATCH -e reports/slurm.%j.sketch.err


# activate conda
. "/home/baumlerc/miniconda3/etc/profile.d/conda.sh"

# activate sourmash env
conda activate sourmash

# Sketch the hu datasets
sourmash sketch dna -p scaled=1000,k=21,k=31,k=51 hu/*.fq.gz --name-from-first --outdir hu/

### Wow I can't believe you made everything public. 
