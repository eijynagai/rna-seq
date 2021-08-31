# 変数の指定
db=Ensembl
build=GRCm38
mkdir -p rsem # ディレクトリの作成
# rsem_merge.sh <files> <output> <Ensembl|UCSC> <build> <除去したい文字列> と指定する
rsem_merge.sh "star/WT_Rep1 star/WT_Rep2 star/NIPBL_Rep1 star/NIPBL_Rep2" rsem/Matrix $db $build "XXX"
