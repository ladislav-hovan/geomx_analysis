from scripts.calculate_lioness_networks import calculate_lioness_networks

rule calculate_lioness_networks:
    input:
        F_EXPRESSION_FILE,
        F_MOTIF_FILE,
        F_PPI_FILE,
    output:
        LIONESS_FEATHER
    threads:
        config['lioness_threads']
    run:
        calculate_lioness_networks(input[0], input[1], input[2], output[0],
            None, None, threads)