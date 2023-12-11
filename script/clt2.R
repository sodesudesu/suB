# 2023/12/10
# 中心極限定理やり直し

rm(list=ls())

### コインの一様分布
x = sample(0:1, 10000, replace=TRUE) # 10000回投げる
png("../fig/coin1x10000.png", width=640, height=480, type="cairo")
barplot((table(c(x, 0:1))-1)/10000, xlab="表の出た回数", ylab="", main="")
dev.off()

### サイコロの一様分布
x = sample(1:6, 10000, replace=TRUE) # 10000回投げる
png("../fig/dice1x10000.png", width=640, height=480, type="cairo")
barplot((table(c(x, 1:5)) - 1)/10000, xlab="サイコロの目", ylab="", main="")
dev.off()

### コインを2つ投げる
x = sample(0:1, 10000, replace=TRUE) # 10000回投げる
y = sample(0:1, 10000, replace=TRUE) # 10000回投げる
png("../fig/coin2x10000.png", width=480, height=360, type="cairo")
barplot((table(c(x+y, 0:2)) - 1)/10000, xlab="表の出た回数", ylab="", main="")
dev.off()

### サイコロを2つなげる
x = sample(1:6, 10000, replace=TRUE) # 10000回投げる
y = sample(1:6, 10000, replace=TRUE) # 10000回投げる
png("../fig/dice2x10000.png", width=480, height=360, type="cairo")
barplot((table(c(x+y, 2:12)) - 1)/10000, xlab="サイコロの目", ylab="", main="")
dev.off()

### コインを5つ投げる
n = 5
x = 0
for(i in 1:n){
    x = x + sample(0:1, 10000, replace=TRUE)
}

png("../fig/coin5x10000.png", width=480, height=360, type="cairo")
barplot((table(c(x, 0:n)) - 1)/10000, xlab="表の出た回数", ylab="", main="")
dev.off()

### さいころを5つ投げる
n = 5
x = 0
for(i in 1:n){
    x = x + sample(1:6, 10000, replace=TRUE)
}

png("../fig/dice5x10000.png", width=480, height=360, type="cairo")
barplot((table(c(x, n:(6*n))) - 1)/10000, xlab="サイコロの目の和", ylab="", main="")
dev.off()

### コインを100つ投げる
n = 100
x = 0
for(i in 1:n){
    x = x + sample(0:1, 1000000, replace=TRUE)
}

png("../fig/coin100x1000000.png", width=480, height=360, type="cairo")
barplot((table(c(x, 0:n)) - 1)/1000000, xlab="表の出た回数", ylab="", main="")
dev.off()

### さいころを100つ投げる
n = 100
x = rep(0, 1000000)
for(i in 1:n){
    x = x + sample(1:6, 1000000, replace=TRUE)
}

png("../fig/dice100x1000000.png", width=480, height=360, type="cairo")
barplot((table(c(x, n:(6*n)) - 1))/1000000, xlab="サイコロの目の和", ylab="", main="")
dev.off()

### コインに正規分布を重ねる
n = 100
x = 0
for(i in 1:n){
    x = x + sample(0:1, 1000000, replace=TRUE)
}

# 正規分布をかく関数
mu = 50
sig = sqrt(100/2/2)
gauss = dnorm(0:n, mean = mu, sd = sig)

png("../fig/coin_g.png", width=480, height=360, type="cairo")
barplot((table(c(x, 0:n)) - 1)/1000000, xlab="表の出た回数", ylab="", main="")
par(new=TRUE)
lines(0:n, gauss, col = "red", lwd = 2)
dev.off()
