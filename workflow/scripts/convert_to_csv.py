#!/usr/bin/env python

### Imports ###
import pandas as pd

from pathlib import Path

### Functions ###
def convert_to_csv(
    input_file: Path,
    output_path: Path,
) -> None:
    """
    Converts a file from tsv format to csv.

    Parameters
    ----------
    input_file : Path
        Path to the tsv file with the data
    output_path : Path
        Path to save the csv file to
    """

    data = pd.read_table(input_file, index_col=0)
    data.to_csv(output_path)

### Main body ###
if __name__ == '__main__':
    from argparse import ArgumentParser

    parser = ArgumentParser()
    parser.add_argument('-i', '--input', dest='input',
        help='tsv file to load the data from', metavar='FILE')
    parser.add_argument('-o', '--output', dest='output',
        help='csv file to save the data into', metavar='FILE')

    args = parser.parse_args()

    convert_to_csv(
        input_file=args.input,
        output_path=args.output,
    )