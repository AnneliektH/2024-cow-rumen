# predict proteins
rule protein_prediction:
    input:
        contigs = "../resources/{ident}.fasta",
    output:
        prot = "../results/protein/{ident}.faa",
    conda: 
        "pyrodigal"
    threads: 12
    shell:
        """
        pyrodigal -i {input.contigs} \
        -a {output.prot} -p meta \
        -j {threads} --min-gene 200
        """