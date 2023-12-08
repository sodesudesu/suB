rm(list=ls())

# データの読み込み
library(haven)
data = read_sav("../data/STU_QQQ_SPSS/CY08MSP_STU_QQQ.sav")

# データサイズ表示
object.size(data)

# データの様子
summary(data)
dim(data) # サイズ
names(data) # 項目

# 家にデスクトップPCがあるか
table(data$IC001Q01TA)
