rule calculate_lioness_networks:
    input:
        F_EXPRESSION_FILE,
        F_MOTIF_FILE,
        F_PPI_FILE,
    output:
        LIONESS_FILE,
    threads:
        config['lioness_threads']
    shell:
        """
        calculate_lioness_networks(input[0], input[1], input[2], output[0],
            None, None, threads)
        """