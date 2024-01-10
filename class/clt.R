# 2024/1/9

rm(list=ls())

library(readxl)
library(tidyverse)

# 個数nとサンプル数t
n = 10
t = 10000

head = 0
for (i in 1:n) {
    head = head + sample(0:1, t, replace=TRUE)
}

# 正規近似
png("10x10000.png", width=1000, height=700, type="cairo")
hist(head, breaks=seq(-0.5, n+0.5, length.out=n+2), xlab="表の回数", ylab="", main="", freq=FALSE)
dev.off()

# 曲線を加える
png("10x10000g.png", width=1000, height=700, type="cairo")
hist(head, breaks=seq(-0.5, n+0.5, length.out=n+2), xlab="表の回数", ylab="", main="", freq=FALSE)
curve(dnorm(x, mean=n/2, sd=sqrt(n/4)), 0, n, col="red", lwd=4, add=TRUE)
dev.off()

n = 10
t = 1000000

# サイコロ
x = rep(0, t)
for(i in 1:n){
    x = x + sample(1:6, t, replace=TRUE)
}

png("dice10x1000000.png", width=1000, height=700, type="cairo")
hist(x, breaks=seq(n-0.5, 6*n+0.5, length.out=5*n+2), xlab="サイコロの目の和", ylab="", main="", freq=FALSE)
dev.off()


png("dice10x1000000g.png", width=1000, height=700, type="cairo")
hist(x, breaks=seq(n-0.5, 6*n+0.5, length.out=5*n+2), xlab="サイコロの目の和", ylab="", main="", freq=FALSE)
curve(dnorm(x, n*3.5, sqrt(n*35/12)), n, 6*n, col = "red", lwd = 4, add=TRUE)
dev.off()


# 指数分布（平均分散1）
n = 200
t = 1000000

x = rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)

y = rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)

z = rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)

a = rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)+ rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1) + rexp(t, 1)

x = x + y + z + a

png("exp200x1000000.png", width=1000, height=700, type="cairo")
hist(x, breaks=50, xlab="", ylab="", main="", freq=FALSE)
dev.off()

png("exp200x1000000g.png", width=1000, height=700, type="cairo")
hist(x, breaks=50, xlab="", ylab="", main="", freq=FALSE)
curve(dnorm(x, n, sqrt(n)), col = "red", lwd = 4, add=TRUE)
dev.off()
