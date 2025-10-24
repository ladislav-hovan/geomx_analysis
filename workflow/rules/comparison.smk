rule create_mapfile:
    input:
        script = join(script_dir, 'create_mapfile.py'),
        metadata = join(input_dir, config['metadata_file']),
    output:
        mapfile = join(output_dir, 'comparisons', '{column}', '{modality}',
            'groups.tsv'),
    shell:
        """
        {input.script} \
        -f 
        """

rule compare_groups:
    input:
        script = join(script_dir, 'fill_out_template.py'),
        template = join(template_dir, 'compare_template.yaml'),
        data = join(output_dir, 'lioness_output', 'lioness_{modality}.csv'),
        mapfile = join(output_dir, 'comparisons', '{column}', '{modality}',
            'groups.tsv'),
    output:
        config = join(output_dir, 'comparisons', '{column}', '{modality}', '')
        join(output_dir, 'comparisons', '{column}', '{modality}',
            '{groupA}_vs_{groupB}...')
    shell:
        """
        
        """