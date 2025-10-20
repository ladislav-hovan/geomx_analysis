EXPRESSION_FILE = join(input_dir, config['expression_file'])
MOTIF_FILE = join(input_dir, config['motif_file'])
PPI_FILE = join(input_dir, config['ppi_file'])

# After removing outliers
CLEAN_EXPRESSION_FILE = join(output_dir, 'clean_input', 'expression.tsv')

# F_ prefix for filtered
F_EXPRESSION_FILE = join(output_dir, 'filtered_input', 'expression.tsv')
F_MOTIF_FILE = join(output_dir, 'filtered_input', 'motif_prior.tsv')
F_PPI_FILE = join(output_dir, 'filtered_input', 'ppi_prior.tsv')

LIONESS_FILE = join(output_dir, 'lioness_output', 'lioness.feather')
INDEGREE_FILE = join(output_dir, 'lioness_output', 'indegrees.feather')
OUTDEGREE_FILE = join(output_dir, 'lioness_output', 'outdegrees.feather')