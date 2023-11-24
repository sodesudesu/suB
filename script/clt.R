# 2023/11/21
# 中心極限定理の実験

# 変数をリセット
rm(list = ls())

### サイコロ1つを10万回投げる。
x = sample(1:6, 100000, replace=TRUE) # 10万個の乱数
#barplot(table(c(x,1:5)) - 1) # histの代わりに棒グラフを使う
png("../fig/1x10.png", width=640, height=480, type="cairo")
hist(x, breaks = 0.5:6.5,
     xlab="サイコロの目", ylab="頻度", main="")
dev.off()

### サイコロ2つを10万回投げる。
x = sample(1:6, 100000, replace=TRUE) # 10万個の乱数
y = sample(1:6, 100000, replace = TRUE) # 10万個の乱数
ave = (x + y) / 2

png("../fig/2x10.png", width=640, height=480, type="cairo")
hist(ave, breaks = 0.5:6.5,
     xlab = "出た目の平均値", ylab = "頻度", main = "")
dev.off()

### サイコロ3つを10万回投げる。
x = sample(1:6, 100000, replace=TRUE) # 10万個の乱数
y = sample(1:6, 100000, replace = TRUE) # 10万個の乱数
z = sample(1:6, 100000, replace = TRUE) # 10万個の乱数
ave = (x + y + z) / 3

png("../fig/3x10.png", width=640, height=480, type="cairo")
hist(ave, breaks = 0.5:6.5,
     xlab = "出た目の平均値", ylab = "頻度", main = "")
dev.off()

### サイコロ100個を100000回投げる。
x = 0
for (i in 1:100){
    x = x + sample(1:6, 100000, replace=TRUE)
}

png("../fig/100x10.png", width=640, height=480, type="cairo")
hist(x/100, breaks = seq(min(x/100), max(x/100), length.out = 50),
     xlab="出た目の平均値", ylab="頻度", main="")
dev.off()
