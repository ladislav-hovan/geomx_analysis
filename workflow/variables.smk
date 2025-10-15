RAW_EXPRESSION_FILE = os.path.join(input_dir, 'data',
    config['raw_expression_file'])
Q3_EXPRESSION_FILE = os.path.join(input_dir, 'data',
    config['q3_expression_file'])
MOTIF_FILE = os.path.join(input_dir, 'priors', config['motif_file'])
PPI_FILE = os.path.join(input_dir, 'priors', config['ppi_file'])

# F_ prefix for filtered
F_RAW_EXPRESSION_FILE = os.path.join('filtered_input', 'raw', 'expression.tsv')
F_RAW_MOTIF_FILE = os.path.join('filtered_input', 'raw', 'motif_prior.tsv')
F_RAW_PPI_FILE = os.path.join('filtered_input', 'raw', 'ppi_prior.tsv')
F_Q3_EXPRESSION_FILE = os.path.join('filtered_input', 'q3', 'expression.tsv')
F_Q3_MOTIF_FILE = os.path.join('filtered_input', 'q3', 'motif_prior.tsv')
F_Q3_PPI_FILE = os.path.join('filtered_input', 'q3', 'ppi_prior.tsv')

F_EXPRESSION_FILE = os.path.join('filtered_input', '{norm_type}',
    'expression.tsv')
F_MOTIF_FILE = os.path.join('filtered_input', '{norm_type}', 'motif_prior.tsv')
F_PPI_FILE = os.path.join('filtered_input', '{norm_type}', 'ppi_prior.tsv')
LIONESS_FEATHER = os.path.join('lioness_networks', '{norm_type}',
    'lioness.feather')

ANY_LIONESS_FEATHER = os.path.join('lioness_networks', '{path_to_dir}',
    'lioness.feather')
ANY_INDEGREE_FEATHER = os.path.join('lioness_networks', '{path_to_dir}',
    'indegrees.feather')
ANY_OUTDEGREE_FEATHER = os.path.join('lioness_networks', '{path_to_dir}',
    'outdegrees.feather')

INDEGREE_FEATHER_ALL = expand(
    os.path.join('lioness_networks', '{norm_type}', 'indegrees.feather'),
    norm_type=config['norm_types'],
)