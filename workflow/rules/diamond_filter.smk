rule diamond_rdrp:
    input:
        fasta = "../resources/{ident}.fa",
    output:
        res='../results/diamond/diamond.{ident}.RdRp.tsv',
    conda: 
        "diamond"
    threads: 1
    shell:
        """
        diamond blastx -q {input.fasta} \
        --min-orf 600 \
        -e 1e-5 --threads {threads} \
        --very-sensitive \
        --db RDRP_DIAMOND -o {output.diamond}
        """

rule make_contig_list:
    input:
        diamond = "../results/diamond/diamond.{ident}.RdRp.tsv",
    output:
        res='../results/diamond/diamond.{ident}.RdRp.txt',
    conda: 
        "csvtk"
    threads: 1
    shell:
        """
        csvtk cut -t -f 1 {input.diamond} > {output.res}
        """

