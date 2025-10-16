### Imports ###
from os.path import join

### Config file ###
configfile: join('config', 'config.yaml')

### Setup ###
global_resources = workflow.global_resources

if 'gpus' in global_resources and global_resources['gpus'] > 0:
    assert global_resources['gpus'] == len(config['gpu_ids']), (
        'The number of GPUs in resources must match the length of '
        'provided GPU IDs'
    )

    USE_GPU = True
else:
    USE_GPU = False

### Config variables ###
input_dir = config['input_dir']
output_dir = config['output_dir']

### Input and output variables ###
include: join('workflow', 'variables.smk')

### Rules ###
rule all:
    input:
        INDEGREE_FILE
    default_target:
        True

include: join('workflow', 'preprocessing.smk')

include: join('workflow', 'networks_common.smk')

if USE_GPU:
    include: join('workflow', 'networks_gpu.smk')
else:
    include: join('workflow', 'networks_cpu.smk')