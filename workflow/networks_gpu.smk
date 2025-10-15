from scripts.calculate_lioness_networks import calculate_lioness_networks

rule calculate_lioness_networks:
    input:
        F_EXPRESSION_FILE,
        F_MOTIF_FILE,
        F_PPI_FILE,
    output:
        LIONESS_FEATHER
    resources:
        gpus = 1
    run:
        with allocate_gpus(gpu_manager, resources['gpus']) as gpu_ids:
            calculate_lioness_networks(input[0], input[1], input[2],
                output[0], None, gpu_ids[0], 1)