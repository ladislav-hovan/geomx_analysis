rule create_targets_file:
    input:
        script = join(script_dir, 'create_targets_file.py'),
        metadata = CLEAN_METADATA_FILE,
    output:
        targets_file = TARGETS_FILE,
    wildcard_constraints:
        # Doesn't contain any equal signs - that's reserved for restricted
        column = '[a-zA-Z0-9_]+',
    shell:
        """
        {input.script} \
        -m {input.metadata} \
        -p {wildcards.pairing} \
        -c {wildcards.column} \
        -o {output.targets_file}
        """

rule create_restricted_targets_file:
    input:
        script = join(script_dir, 'create_targets_file.py'),
        metadata = CLEAN_METADATA_FILE,
    output:
        targets_file = RESTRICTED_TARGETS_FILE,
    shell:
        """
        {input.script} \
        -m {input.metadata} \
        -p {wildcards.pairing} \
        -sc {wildcards.select_column} \
        -sv {wildcards.select_value} \
        -c {wildcards.column} \
        -o {output.targets_file}
        """

rule run_limma:
    input:
        script = join(script_dir, 'run_limma.R'),
        data_file = LIONESS_OUTPUT,
        targets_file = TARGETS_FILE,
    output:
        limma_results = join(LIMMA_DIR, '{modality}', 'results.tsv'),
    shell:
        """
        {input.script} \
        {input.data_file} \
        {input.targets_file} \
        {wildcards.groupA} \
        {wildcards.groupB} \
        {output.limma_results}
        """