db=Ensembl
build=GRCm38 # humanの場合は GRCh38 に指定

# STARでマッピング、RSEMで遺伝子発現量推定。
# 以下はsingle-endの場合。fastqが複数ある場合はコンマで連結して指定
# 末尾の0 は、stranded RNA-seqの場合。新しくランされるRNA-seqについてはすべてstrandedなので0のままでよい
#star.sh single WT_Rep1    fastq/SRR5168172.fastq.gz,fastq/SRR5168173.fastq.gz $db $build 0
#star.sh single WT_Rep2    fastq/SRR5168174.fastq.gz,fastq/SRR5168175.fastq.gz $db $build 0
#star.sh single NIPBL_Rep1 fastq/SRR5168188.fastq.gz,fastq/SRR5168189.fastq.gz $db $build 0
#star.sh single NIPBL_Rep2 fastq/SRR5168190.fastq.gz,fastq/SRR5168191.fastq.gz $db $build 0


# paired-endの場合は以下のようになる
#star.sh paired <sample name> <fastq1> <fastq2> $db $build 0

# 出力結果はstarディレクトリの中にできる。

# サンプルごとに生成された遺伝子発現量のテーブルをマージ。
# 出力されたサンプル名から取り除きたい文字列がある場合(Run名など)は、最後のXXXのところを取り除きたい文字列に変える
mkdir -p rsem

#rsem-calculate-expression \
#            --alignments \
#            --estimate-rspd \
#            --forward-prob 0 \
#            --no-bam-output \
#            -p 12 \
#            star/WT_Rep1.GRCm38.Aligned.toTranscriptome.out.bam \
#            /work/Database/rsem-star-indexes/Ensembl-GRCm38/Ensembl-GRCm38 \
#            star/WT_Rep1

rsem_merge.sh "star/WT_Rep1 star/WT_Rep2 star/NIPBL_Rep1 star/NIPBL_Rep2" rsem/Matrix $db $build "XXX"
# Matrixという名前のファイルが生成される。これを以下のedgeRの入力にする

# edgeRを用いた発現変動比較解析
# edgeR.sh <input file> $db $build <rep数>:<rep数> <label1>:<label2> <FDR threshold> で指定
edgeR.sh rsem/Matrix $db $build 2:2 WT:NIPBL 0.01
