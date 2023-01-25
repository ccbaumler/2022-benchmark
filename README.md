# 2022-benchmark
benchmarking dib-lab software

```
sourmash_gather
├───.snakemake
├───input
│   ├───hu (sig files)
│   └───reports
├───output
│   ├───flame_out
│   │   ├───csv_files
│   │   ├───reports
│   │   └───svg_files
│   ├───misc  (output from trials)
│   └───smk_out
│       ├───bench (metrics data)
│       └───gather
└───workflow
    └───smk (snakefile)
    └───bench_graphs.ipynb (graphs of metrics)
    └───flamegraph_job.sh  (flamegraph)
    └─── gather_bench.sh
    └───sketch-fq.sh  (sketch sigs)

```

