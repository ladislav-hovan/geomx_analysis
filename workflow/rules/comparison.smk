rule copy_expression:
    input:
        script = join(script_dir, 'convert_to_csv.py'),
        expr = PP_EXPRESSION_FILE,
    output:
        expr = PP_EXPRESSION_COPY,
    shell:
        """
        {input.script} \
        -i {input.expr} \
        -o {output.expr}
        """

rule create_mapfile:
    input:
        script = join(script_dir, 'create_mapfile.py'),
        metadata = CLEAN_METADATA_FILE,
    output:
        mapfile = MAPFILE,
    wildcard_constraints:
        # Doesn't contain any equal signs - that's reserved for restricted
        column = '[a-zA-Z0-9_]+',
    shell:
        """
        {input.script} \
        -m {input.metadata} \
        -c {wildcards.column} \
        -o {output.mapfile}
        """

rule create_restricted_mapfile:
    input:
        script = join(script_dir, 'create_mapfile.py'),
        metadata = CLEAN_METADATA_FILE,
    output:
        mapfile = RESTRICTED_MAPFILE,
    shell:
        """
        {input.script} \
        -m {input.metadata} \
        -sc {wildcards.select_column} \
        -sv {wildcards.select_value} \
        -c {wildcards.column} \
        -o {output.mapfile}
        """

rule compare_groups:
    input:
        script = join(script_dir, 'fill_out_template.py'),
        template = join(template_dir, 'compare_template.yaml'),
        data = LIONESS_OUTPUT,
        mapfile = MAPFILE,
    output:
        config = COMPARE_CONFIG,
        t_comparison = temp(T_COMPARE_FILE),
        t_ranks = temp(T_COMPARE_RANKS),
    params:
        compare_dir = subpath(output.t_ranks, parent=True),
    shell:
        """
        {input.script} \
        -t {input.template} \
        -o {output.config} \
        -s datafile {input.data} \
        -s mapfile {input.mapfile} \
        -s datatype {wildcards.modality} \
        -s groupA {wildcards.groupA} \
        -s groupB {wildcards.groupB} \
        -s test {wildcards.test} \
        -s rank_metric {wildcards.metric} \
        -s output_dir {params.compare_dir}

        sisana compare {output.config}
        """

rule rename_compare_files:
    input:
        t_comparison = T_COMPARE_FILE,
        t_ranks = T_COMPARE_RANKS,
    output:
        comparison = COMPARE_FILE,
        ranks = COMPARE_RANKS,
    params:
        compare_dir = subpath(output.ranks, parent=True),
    shell:
        """
        mv {input.t_comparison} {output.comparison}
        mv {input.t_ranks} {output.ranks}
        """