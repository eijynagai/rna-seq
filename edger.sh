# 変数の指定
db=Ensembl
build=GRCm38
# edgeR.sh <input file> $db $build <rep数>:<rep数> <label1>:<label2> <FDR threshold> で指定
edgeR.sh rsem/Matrix $db $build 2:2 WT:NIPBL 0.01
