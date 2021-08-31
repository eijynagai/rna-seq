# 変数の指定
db=Ensembl
build=GRCm38 # humanの場合は GRCh38 に指定

star.sh single WT_Rep1    fastq/SRR5168172.fastq.gz,fastq/SRR5168173.fastq.gz $db $build 0
star.sh single WT_Rep2    fastq/SRR5168174.fastq.gz,fastq/SRR5168175.fastq.gz $db $build 0
star.sh single NIPBL_Rep1 fastq/SRR5168188.fastq.gz,fastq/SRR5168189.fastq.gz $db $build 0
star.sh single NIPBL_Rep2 fastq/SRR5168190.fastq.gz,fastq/SRR5168191.fastq.gz $db $build 0

