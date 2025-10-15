# GeoMx analysis pipeline
This Snakemake pipeline analyzes the GeoMx data from the EyeMT project.


## Table of Contents
- [GeoMx analysis pipeline](#geomx-analysis-pipeline)
  - [Table of Contents](#table-of-contents)
  - [General Information](#general-information)
  - [Features](#features)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Project Status](#project-status)
  - [Room for Improvement](#room-for-improvement)
  - [Acknowledgements](#acknowledgements)
  - [Contact](#contact)
  - [License](#license)


## General Information
This pipeline processes the GeoMx expression data into gene regulatory
networks using LIONESS and then performs the downstream analysis.

The entire pipeline is implemented using Snakemake.
It will utilise a GPU to compute networks when available, but can also
use CPUs only.


## Features
The features already available are:
- Cleanup of expression data and prior networks
- Generation of LIONESS networks


## Setup
The requirements are provided in a `requirements.txt` file.


## Usage
Running a Snakemake pipeline is straightforward:

``` bash
snakemake --cores=10 --resources gpus=1
```

It is assumed that all the input is present and that the settings in the
`config.yaml` file are correct.
Relevant settings are:
- `input_dir`: the directory containing the input files
- `expression_file`: name of the gene expression file
- `motif_file`: name of the motif prior file
- `ppi_file`: name of the PPI prior file
- `gpu_id`: the ID of GPU to use


## Project Status
The project is: _in progress_.


## Room for Improvement
Room for improvement:
- Convert the pipeline to use SiSaNA

To do:
- Analysis part
- Container


## Acknowledgements
Many thanks to the members of the 
[Kuijjer group](https://www.kuijjerlab.org/) 
at NCMBM/UH for their feedback and support.

This README is based on a template made by 
[@flynerdpl](https://www.flynerd.pl/).


## Contact
Created by Ladislav Hovan (ladislav.hovan@ncmbm.uio.no).
Feel free to contact me!


## License
This project is open source and available under the 
[GNU General Public License v3](LICENSE).