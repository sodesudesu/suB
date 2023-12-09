rm(list=ls())

# データの読み込み
library(haven)
data = read_sav("../data/CY08MSP_STU_QQQ.sav")

# データサイズ表示
object.size(data)

# データの様子
summary(data)

dim(data) # サイズ

names(data) # 項目

plot(data$IC170Q01JA, data$IC170Q02JA)

x = table(data$CNT, data$IC170Q01JA)
head(x)

barplot(sort(x[,1] / rowSums(x[,1:2])), horiz=TRUE, las=1)
