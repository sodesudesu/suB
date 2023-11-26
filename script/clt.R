# 2023/11/21
# 中心極限定理の実験

# 変数をリセット
rm(list = ls())

### サイコロ1つを10万回投げる。
x = sample(1:6, 100000, replace=TRUE) # 10万個の乱数
png("../fig/1x10.png", width=640, height=480, type="cairo")
barplot(table(c(x, 1:5)) - 1,
        xlab="サイコロの目", ylab="頻度", main="")
#hist(x, breaks = 0.5:6.5,
#     xlab="サイコロの目", ylab="頻度", main="")
dev.off()

### サイコロ2つを10万回投げる。
x = sample(1:6, 100000, replace=TRUE) # 10万個の乱数
y = sample(1:6, 100000, replace = TRUE) # 10万個の乱数
ave = (x + y) / 2

png("../fig/2x10.png", width=640, height=480, type="cairo")
#hist(ave, breaks = 0.5:6.5,
#     xlab = "出た目の平均値", ylab = "頻度", main = "")
barplot(table(c(ave, 1:5)) - 1,
        xlab="サイコロの目", ylab="頻度", main="")
dev.off()

### サイコロ3つを10万回投げる。
x = sample(1:6, 100000, replace=TRUE) # 10万個の乱数
y = sample(1:6, 100000, replace = TRUE) # 10万個の乱数
z = sample(1:6, 100000, replace = TRUE) # 10万個の乱数
ave = (x + y + z) / 3

png("../fig/3x10.png", width=640, height=480, type="cairo")
#hist(ave, breaks = 0.5:6.5,
#     xlab = "出た目の平均値", ylab = "頻度", main = "")
barplot(table(c(ave, 1:5)) - 1,
        xlab="サイコロの目", ylab="頻度", main="")
dev.off()

### サイコロ100個を100000回投げる。
x = 0
for (i in 1:100){
    x = x + sample(1:6, 100000, replace=TRUE)
}

# 縦軸頻度のグラフ
png("../fig/1000x10.png", width=640, height=480, type="cairo")
#hist(x/1000, breaks = seq(min(x/1000), max(x/1000), length.out = 80),
#     xlab="出た目の平均値", ylab="頻度", main="")
barplot(table(c(x/100, 1:5)) - 1,
        xlab="サイコロの目", ylab="頻度", main="")
dev.off()

# 面積1になるグラフ
png("../fig/1000x10-2.png", width=640, height=480, type="cairo")
#hist(x/1000, breaks = seq(min(x/1000), max(x/1000), length.out = 80),
#     xlab="出た目の平均値", ylab="", main="", freq = FALSE)
barplot((table(c(x/100, 1:5)) - 1) / sum(table(c(x/100, 1:5)) - 1),
        xlab="サイコロの目", ylab="", main="")
dev.off()

# 正規分布をかく関数
mu = 3.5
sig2 = 35/1200
gauss = function(x){
    return(
        1 / sqrt(2 * pi * 35/1200) * exp(- 1 / 2 * (x - 3.5)^2 / (35/1200))
    )
}

png("../fig/1000x10-3.png", width=640, height=480, type="cairo")
hist(x/100, breaks = seq(min(x/100), max(x/100), length.out = 38),
     xlab="出た目の平均値", ylab="頻度", main="", freq = FALSE)
#barplot((table(c(x/100, 1:5)) - 1) / sum(table(c(x/100, 1:5)) - 1),
#        xlab="サイコロの目", ylab="", main="")
curve(gauss(x), add=TRUE, col="red")
dev.off()
