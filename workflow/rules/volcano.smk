def get_difftype(
    metric: str,
) -> str:

    if 'median' in metric:
        return 'median'
    else:
        return 'mean'

def get_x_thresh(
    metric: str,
    modality: str,
) -> float:
    """
    

    Parameters
    ----------
    metric : str
        _description_
    modality : str
        _description_

    Returns
    -------
    float
        _description_
    """

    if metric == 'meandiff':
        return 1.5
    elif metric == 'mediandiff':
        if modality == 'expression':
            return 0.5
        elif modality == 'indegree':
            return 5
        elif modality == 'outdegree':
            return 100
    # "Sensible" default
    return 2    


rule create_volcanoplot:
    input:
        script = join(script_dir, 'fill_out_template.py'),
        template = join(template_dir, 'volcano_template.yaml'),
        comparison = COMPARE_FILE,
    output:
        config = VOLCANO_CONFIG,
        t_volcano = temp(T_VOLCANO_PLOT),
    params:
        diffcol = lambda wildcards: 'difference_of_'
            f'{get_difftype(wildcards.metric)}s_'
            f'\\({wildcards.groupB}-{wildcards.groupA}\\)',
        x_thresh = lambda wildcards: get_x_thresh(wildcards.metric,
            wildcards.modality),
        difftype = lambda wildcards: get_difftype(wildcards.metric),
        volcano_dir = subpath(output.t_volcano, parent=True),
    shell:
        """
        {input.script} \
        -t {input.template} \
        -o {output.config} \
        -s statsfile {input.comparison} \
        -s diffcol {params.diffcol} \
        -s x_thresh {params.x_thresh} \
        -s pval_thresh {wildcards.pval} \
        -s difftype {params.difftype} \
        -s output_dir {params.volcano_dir}

        sisana visualize volcano {output.config} || touch {output.t_volcano}
        """

rule rename_volcano_plot:
    input:
        t_volcano = T_VOLCANO_PLOT,
    output:
        volcano = VOLCANO_PLOT,
    params:
        volcano_dir = subpath(output.volcano, parent=True),
    shell:
        """
        mv {input.t_volcano} {output.volcano}
        """