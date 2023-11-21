# 2023/11/20
# とりあえず線形回帰をぶん回し、相関が大きいペアを探す。

# ワーキングディレクトリをscriptに設定
setwd("~/uni/stat/script/")

# 変数のリセット
rm(list = ls())

# library
library(psych)

# CSVの読み込み
dataA = read.csv("../data/SSDSE-A-2023.csv", fileEncoding = "cp932", skip = 2)
dataB = read.csv("../data/SSDSE-B-2023.csv", fileEncoding = "cp932", skip = 2)
dataC = read.csv("../data/SSDSE-C-2023.csv", fileEncoding = "cp932", skip = 2)
dataD = read.csv("../data/SSDSE-D-2023.csv", fileEncoding = "cp932", skip = 2)
dataE = read.csv("../data/SSDSE-E-2023.csv", fileEncoding = "cp932", skip = 2)

# 回帰分析
dataA_cor = psych(
