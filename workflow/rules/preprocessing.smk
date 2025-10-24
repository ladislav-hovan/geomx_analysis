rule remove_outliers:
    input:
        script = join(script_dir, 'remove_outliers.py'),
        expr = EXPRESSION_FILE,
    output:
        expr = CLEAN_EXPRESSION_FILE,
    params:
        ids = outlier_ids,
    shell:
        """
        {input.script} \
        -i {input.expr} \
        -id {params.ids} \
        -o {output.expr}
        """

rule filter_expression_and_priors:
    input:
        script = join(script_dir, 'filter_expression_and_priors.py'),
        expr = CLEAN_EXPRESSION_FILE,
        motif = MOTIF_FILE,
        ppi = PPI_FILE,
    output:
        expr = F_EXPRESSION_FILE,
        motif = F_MOTIF_FILE,
        ppi = F_PPI_FILE,
    shell:
        """
        {input.script} \
        -e {input.expr} \
        -mp {input.motif} \
        -pp {input.ppi} \
        -eo {output.expr} \
        -mpo {output.motif} \
        -ppo {output.ppi}
        """

preprocess_dir = dirname(PP_EXPRESSION_FILE)

rule preprocess_input_files:
    input:
        script = join(script_dir, 'fill_out_template.py'),
        template = join(template_dir, 'preprocess_template.yaml'),
        expr = F_EXPRESSION_FILE,
    output:
        config = PP_CONFIG,
        expr = PP_EXPRESSION_FILE,
    shell:
        """
        {input.script} \
        -t {input.template} \
        -o {output.config} \
        -s expression {input.expr} \
        -s output_dir {preprocess_dir}

        sisana preprocess {output.config}
        """