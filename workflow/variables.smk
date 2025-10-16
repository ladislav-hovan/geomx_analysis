EXPRESSION_FILE = join(input_dir, 'data', config['expression_file'])
MOTIF_FILE = join(input_dir, 'priors', config['motif_file'])
PPI_FILE = join(input_dir, 'priors', config['ppi_file'])

# F_ prefix for filtered
F_EXPRESSION_FILE = join(output_dir, 'filtered_input', 'expression.tsv')
F_MOTIF_FILE = join(output_dir, 'filtered_input', 'motif_prior.tsv')
F_PPI_FILE = join(output_dir, 'ppi_prior.tsv')

LIONESS_FEATHER = join(output_dir, 'lioness_networks', 'lioness.feather')
INDEGREE_FEATHER = join(output_dir, 'lioness_networks', 'indegrees.feather')
OUTDEGREE_FEATHER = join(output_dir, 'lioness_networks', 'outdegrees.feather')