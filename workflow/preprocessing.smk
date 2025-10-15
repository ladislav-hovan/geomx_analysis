from scripts.filter_expression_and_priors import filter_expression_and_priors

rule filter_raw_expression_and_priors:
    input:
        RAW_EXPRESSION_FILE,
        MOTIF_FILE,
        PPI_FILE,
    output:
        F_RAW_EXPRESSION_FILE,
        F_RAW_MOTIF_FILE,
        F_RAW_PPI_FILE,
    run:
        filter_expression_and_priors(input[0], input[1], input[2],
            output[0], output[1], output[2])

rule filter_q3_expression_and_priors:
    input:
        Q3_EXPRESSION_FILE,
        MOTIF_FILE,
        PPI_FILE,
    output:
        F_Q3_EXPRESSION_FILE,
        F_Q3_MOTIF_FILE,
        F_Q3_PPI_FILE,
    run:
        filter_expression_and_priors(input[0], input[1], input[2],
            output[0], output[1], output[2])