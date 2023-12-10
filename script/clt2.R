# 2023/12/10
# 中心極限定理やり直し

rm(list=ls())

### コインの一様分布
x = sample(0:1, 10000, replace=TRUE) # 10000回投げる
png("../fig/coin1x10000.png", width=640, height=480, type="cairo")
barplot((table(c(x, 0:1))-1)/10000, xlab="コインの表裏", ylab="", main="")
dev.off()

### サイコロの一様分布
x = sample(1:6, 10000, replace=TRUE) # 10000回投げる
png("../fig/dice1x10000.png", width=640, height=480, type="cairo")
barplot((table(c(x, 1:5)) - 1)/10000, xlab="サイコロの目", ylab="", main="")
dev.off()
