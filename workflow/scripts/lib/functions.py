### Imports ###
import pandas as pd

from netZooPy.lioness import Lioness
from netZooPy.panda import Panda
from pathlib import Path
from typing import Literal

### Functions ###
def create_lioness_networks(
    expression: pd.DataFrame,
    motif_prior: pd.DataFrame,
    ppi_prior: pd.DataFrame,
    output_dir: Path,
    computing: Literal['cpu', 'gpu'],
    lioness_options: dict,
) -> None:
    """
    Calculates the LIONESS networks from the provided input files using
    the provided settings and saves them in the provided output
    directory.

    Parameters
    ----------
    expression : pd.DataFrame
        pandas DataFrame containing the expression data
    motif_prior : pd.DataFrame
        pandas DataFrame containing the gene regulation prior
    ppi_prior : pd.DataFrame
        pandas DataFrame containing the PPI prior
    output_dir : Path
        Path to a directory where the output file will be saved
    computing : Literal["cpu", "gpu"]
        Which type of computing will be used
    lioness_options : dict
        Keyword options passed to the Lioness object
    """

    panda_obj = Panda(expression, motif_prior, ppi_prior, computing=computing,
        save_memory=False, keep_expression_matrix=True)
    _ = Lioness(panda_obj, computing=computing, save_dir=output_dir,
        save_fmt='npy', **lioness_options)