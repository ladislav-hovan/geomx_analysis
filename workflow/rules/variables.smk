### Inputs ###
EXPRESSION_FILE = join(input_dir, config['expression_file'])
MOTIF_FILE = join(input_dir, config['motif_file'])
PPI_FILE = join(input_dir, config['ppi_file'])
METADATA_FILE = join(input_dir, config['metadata_file'])

### Preprocessing ###
# After removing outliers
CLEAN_EXPRESSION_FILE = join(output_dir, 'input', 'clean', 'expression.tsv')
CLEAN_METADATA_FILE = join(output_dir, 'input', 'clean', 'metadata.tsv')
# F_ prefix for filtered
F_EXPRESSION_FILE = join(output_dir, 'input', 'filtered', 'expression.tsv')
F_MOTIF_FILE = join(output_dir, 'input', 'filtered', 'motif_prior.tsv')
F_PPI_FILE = join(output_dir, 'input', 'filtered', 'ppi_prior.tsv')
# PP_ prefix for preprocessed
PP_CONFIG = join(output_dir, 'input', 'preprocessed', 'config.yaml')
PP_EXPRESSION_FILE = join(output_dir, 'input', 'preprocessed',
    'expression_preprocessed.txt')
PP_EXPRESSION_COPY = join(output_dir, 'lioness_output',
    'lioness_expression.csv')

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
LIONESS_OUTPUT = join(output_dir, 'lioness_output', 'lioness_{modality}.csv')
MAPFILE = join(output_dir, 'comparisons', '{column}', 'groups.csv')
RESTRICTED_MAPFILE = join(output_dir, 'comparisons',
    '{select_column}={select_value}__{column}', 'groups.csv')
COMPARE_DIR = join(output_dir, 'comparisons', '{column}', '{groupA}_{groupB}',
    '{modality}', '{test}', '{metric}')
COMPARE_CONFIG = join(COMPARE_DIR, 'config.yaml')
T_COMPARE_FILE = join(COMPARE_DIR, 'comparison_{test}_between_{groupA}_'
    '{groupB}_{modality}.txt')
COMPARE_FILE = join(COMPARE_DIR, 'comparison.txt')
T_COMPARE_RANKS = join(COMPARE_DIR, 'comparison_{test}_between_{groupA}_'
    '{groupB}_{modality}_ranked_{metric}.rnk')
COMPARE_RANKS = join(COMPARE_DIR, 'comparison.rnk')

### GSEA ###
GSEA_DIR = join(output_dir, 'gsea', '{column}', '{groupA}_{groupB}',
    '{modality}', '{test}', '{metric}', '{geneset_name}')
GSEA_CONFIG = join(GSEA_DIR, 'config.yaml')
T_GSEA_RESULTS = join(GSEA_DIR, 'comparison_prerank_GSEA_{geneset_name}_'
    'results.txt')
GSEA_RESULTS = join(GSEA_DIR, 'GSEA_results.txt')
T_GSEA_ENRICHMENT = join(GSEA_DIR, 'comparison_GSEA_{geneset_name}_basic_'
    'enrichment_plot.png')
GSEA_ENRICHMENT = join(GSEA_DIR, 'enrichment_plot.png')
T_GSEA_DOTPLOT = join(GSEA_DIR, 'comparison_GSEA_{geneset_name}_basic_'
    'enrichment_dotplot.png')
GSEA_DOTPLOT = join(GSEA_DIR, 'dotplot.png')

### Volcano ###
VOLCANO_DIR = join(output_dir, 'volcano', '{column}', '{groupA}_{groupB}',
    '{modality}', '{test}', '{metric}', '{pval}')
VOLCANO_CONFIG = join(VOLCANO_DIR, 'config.yaml')
T_VOLCANO_PLOT = join(VOLCANO_DIR, 'volcano_plot_adjp_{pval}.png')
VOLCANO_PLOT = join(VOLCANO_DIR, 'volcano_plot.png')