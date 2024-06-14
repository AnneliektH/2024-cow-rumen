rule hmmscan:
    input:
        contigs = "../results/protein/{ident}.faa",
    output:
        hmm_out = "../results/hmmr/{ident}.out",
        hmm_tab = "../results/hmmr/{ident}.tab.out",
    conda: 
        "hmmr"
    threads: 4
    shell:
        """
        hmmscan --cpu {threads} -E 0.00001 -o {output.hmm_out} --tblout {output.hmm_tab} \
        {RDRP_HMM} {input.contigs}
        """