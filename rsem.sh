rsem-calculate-expression \
         --alignments \
         --estimate-rspd \
         --forward-prob 0 \
         --no-bam-output \
         -p 12 \
         star/WT_Rep1.GRCm38.Aligned.toTranscriptome.out.bam \
         /work/Database/rsem-star-indexes/Ensembl-GRCm38/Ensembl-GRCm38 \
         star/WT_Rep1
