mkdir star
STAR --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM --runThreadN 12 \
     --outSAMattributes All --readFilesCommand zcat \
     --genomeDir /work/Database/rsem-star-indexes/Ensembl-GRCm38 \
     --readFilesIn fastq/SRR5168172.fastq.gz,fastq/SRR5168173.fastq.gz \
     --outFileNamePrefix star/WT_Rep1.  # 出力ファイル名 (最後のピリオドを忘れず)
