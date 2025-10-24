compute = 'gpu' if USE_GPU else 'cpu'
n_threads = 1 if USE_GPU else config['lioness_threads']
gpu_id = 0 if 'gpu_id' not in config else config['gpu_id']

rule calculate_lioness_networks:
    input:
        script = join(script_dir, 'fill_out_template.py'),
        template = join(template_dir, 'generate_template.yaml'),
        expr = PP_EXPRESSION_FILE,
        motif = F_MOTIF_FILE,
        ppi = F_PPI_FILE,
    output:
        config = LIONESS_CONFIG,
        panda = temp(PANDA_FILE),
        p_indegree = temp(PANDA_INDEGREE_FILE),
        p_outdegree = temp(PANDA_OUTDEGREE_FILE),
        lioness = protected(LIONESS_FILE),
        indegree = INDEGREE_FILE,
        outdegree = OUTDEGREE_FILE,
    threads:
        n_threads
    resources:
        gpus = int(USE_GPU),
    shell:
        """
        {input.script} \
        -t {input.template} \
        -o {output.config} \
        -s expression {input.expr} \
        -s motif_prior {input.motif} \
        -s ppi_prior {input.ppi} \
        -s compute {compute} \
        -s n_cores {threads} \
        -s panda_savepath {output.panda} \
        -s lioness_savepath {output.lioness}

        CUDA_VISIBLE_DEVICES={gpu_id} \
        sisana generate {output.config}
        """