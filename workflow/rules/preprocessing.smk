rule remove_outliers:
    input:
        expr = EXPRESSION_FILE,
    output:
        expr = CLEAN_EXPRESSION_FILE,
    params:
        ids = outlier_ids,
    shell:
        """
        workflow/scripts/remove_outliers.py \
        -i {input.expr} \
        -id {params.ids} \
        -o {output.expr}
        """

rule filter_expression_and_priors:
    input:
        expr = CLEAN_EXPRESSION_FILE,
        motif = MOTIF_FILE,
        ppi = PPI_FILE,
    output:
        expr = F_EXPRESSION_FILE,
        motif = F_MOTIF_FILE,
        ppi = F_PPI_FILE,
    shell:
        """
        workflow/scripts/filter_expression_and_priors.py \
        -e {input.expr} \
        -mp {input.motif} \
        -pp {input.ppi} \
        -eo {output.expr} \
        -mpo {output.motif} \
        -ppo {output.ppi}
        """