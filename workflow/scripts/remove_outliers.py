#!/usr/bin/env python

### Imports ###
import pandas as pd

from pathlib import Path
from typing import List

### Functions ###
def remove_outliers(
    input_path: Path,
    ids: List[str],
    output_path: Path,
    axis: int = 1,
) -> None:
    """
    Removes the selected IDs from the columns or rows of a table.

    Parameters
    ----------
    input_path : Path
        Path to the expression table
    ids : List[str]
        List of IDs to remove
    output_path : Path
        Path where the modified table should be saved
    axis : int, optional
        0 for index or 1 for columns, by default 1
    """

    expr_df = pd.read_table(input_path, index_col=0)
    expr_df.drop(labels=ids, axis=axis).to_csv(output_path, sep='\t',
        index_label=False)

### Main body ###
if __name__ == '__main__':
    from argparse import ArgumentParser

    parser = ArgumentParser()
    parser.add_argument('-i', '--input', dest='input',
        help='file to load the data from', metavar='FILE')
    parser.add_argument('-id', '--id', dest='ids', nargs='*',
        help='IDs to remove from the data table', metavar='ID')
    parser.add_argument('-o', '--output', dest='output',
        help='file to save the clean data into', metavar='FILE')
    parser.add_argument('-a', '--axis', dest='axis', type=int,
        help='0 for index or 1 for columns', metavar='[01]')

    args = parser.parse_args()

    remove_outliers(
        input_path=args.input,
        ids=args.ids,
        output_path=args.output,
        axis=args.axis,
    )