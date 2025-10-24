### Inputs ###
EXPRESSION_FILE = join(input_dir, config['expression_file'])
MOTIF_FILE = join(input_dir, config['motif_file'])
PPI_FILE = join(input_dir, config['ppi_file'])

### Preprocessing ###
# After removing outliers
CLEAN_EXPRESSION_FILE = join(output_dir, 'input', 'clean', 'expression.tsv')
# F_ prefix for filtered
F_EXPRESSION_FILE = join(output_dir, 'input', 'filtered', 'expression.tsv')
F_MOTIF_FILE = join(output_dir, 'input', 'filtered', 'motif_prior.tsv')
F_PPI_FILE = join(output_dir, 'input', 'filtered', 'ppi_prior.tsv')
# PP_ prefix for preprocessed
PP_CONFIG = join(output_dir, 'input', 'preprocessed', 'config.yaml')
PP_EXPRESSION_FILE = join(output_dir, 'input', 'preprocessed',
    'expression_preprocessed.txt')

### Network generation ###
LIONESS_CONFIG = join(output_dir, 'lioness_output', 'config.yaml')
# PANDA output
PANDA_FILE = join(output_dir, 'lioness_output', 'panda_network.txt')
PANDA_INDEGREE_FILE = join(output_dir, 'lioness_output',
    'panda_network_indegree.csv')
PANDA_OUTDEGREE_FILE = join(output_dir, 'lioness_output',
    'panda_network_outdegree.csv')
# LIONESS output
LIONESS_FILE = join(output_dir, 'lioness_output', 'lioness_networks.npy')
INDEGREE_FILE = join(output_dir, 'lioness_output', 'lioness_indegree.csv')
OUTDEGREE_FILE = join(output_dir, 'lioness_output', 'lioness_outdegree.csv')

### Group comparison ###
