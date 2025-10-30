rule run_gsea:
    input:
        script = join(script_dir, 'fill_out_template.py'),
        template = join(template_dir, 'gsea_template.yaml'),
        ranks = COMPARE_RANKS,
        gmt_file = lambda wildcards: join(input_dir,
            config['gene_sets'][wildcards.geneset_name]),
    output:
        config = GSEA_CONFIG,
        t_gsea = temp(T_GSEA_RESULTS),
        t_enrich_plot = temp(T_GSEA_ENRICHMENT),
        t_dotplot = temp(T_GSEA_DOTPLOT),
    params:
        gsea_dir = subpath(output.t_gsea, parent=True),
    shell:
        """
        {input.script} \
        -t {input.template} \
        -o {output.config} \
        -s genefile {input.ranks} \
        -s gmtfile {input.gmt_file} \
        -s geneset_name {wildcards.geneset_name} \
        -s output_dir {params.gsea_dir}

        sisana gsea {output.config} || touch {output.t_dotplot}

        cd {params.gsea_dir}
        rm -rf prerank
        rm -f *.log
        rm -f gene_sets.gmt
        rm -f prerank_data.rnk
        """

rule rename_gsea_files:
    input:
        t_gsea = T_GSEA_RESULTS,
        t_enrich_plot = T_GSEA_ENRICHMENT,
        t_dotplot = T_GSEA_DOTPLOT,
    output:
        gsea = GSEA_RESULTS,
        enrich_plot = GSEA_ENRICHMENT,
        dotplot = GSEA_DOTPLOT,
    params:
        gsea_dir = subpath(output.gsea, parent=True),
    shell:
        """
        mv {input.t_gsea} {output.gsea}
        mv {input.t_enrich_plot} {output.enrich_plot}
        mv {input.t_dotplot} {output.dotplot}
        """