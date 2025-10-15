from scripts.calculate_degrees import calculate_degrees

rule calculate_degrees:
    input:
        ANY_LIONESS_FEATHER
    output:
        ANY_INDEGREE_FEATHER,
        ANY_OUTDEGREE_FEATHER,
    run:
        calculate_degrees(input[0], output[0], output[1])