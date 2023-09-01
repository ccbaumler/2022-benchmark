#! /usr/bin/env python

import sys
import os.path as op
import argparse
import snakemake.parser as smp
import snakemake.common as smc

from snakemake.workflow import Workflow
from snakemake.parser import Snakefile, parse

def main():
    p = argparse.ArgumentParser(description="Parses snakemake file and allow the systematic input of sections")
    p.add_argument('-i', '--input', help='The snakefile you would like to parse and update.')
    p.add_argument('-o', '--output', nargs='?', help='The updated snakefile!')

    arg = p.parse_args()

    input_path = arg.input
    output_path = arg.output
    print(input_path)
    print(output_path)
    print(op.basename(arg.input))
    print(op.dirname(arg.input))
    print(smc.is_local_file(input_path))

    code, _linemap, rules = parse(input_path, workflow=Workflow(op.basename(arg.input)))
    
    
#    with open(output_path, mode="w") as fp:
#        print(code, file=fp)
    
#    print("Done, rules:", str(rules))
#    print("Saved to ", output_path)

if __name__ == '__main__':
    sys.exit(main())
