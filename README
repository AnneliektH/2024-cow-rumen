### RdRps in cow rumen transcriptomic data
To look for RdRps in this dataset, we will have to compare the contigs to already known RdRps. 
[RdRp-scan](https://github.com/JustineCharon/RdRp-scan) has nice databases for this, manually curated. Will use these databases and part of their workflow to investigate this dataset. 

**Steps:**
1. DIAMOND blastx to the RdRp-scan DIAMOND database
2. predict proteins using pyrodigal, keep everything > 200 AA
3. Use HMMScan to compare protein clusters against RdRp-scan HMM database
4. Take all contigs that had a match from either step 1 or step 3. 
5. DIAMOND blastx all these contigs against nr. remove all that have a hit to anything other than viral proteins in nr
6. Cluster resulting proteins with match at 99% identity using cdhit
7. Align resulting protein clusters with known RdRps using ClustalO


Steps 1, 2, 3 were done in snakemake. Step 4 was done using the parse_hmm notebook. 