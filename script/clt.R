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

### サイコロn個をm回投げる。
#n = 100000 # 標本数
#m = 100000 # 各標本の要素数

#y = 0
#for (i in 1:n){
#    y = y + sample(1:6, n, replace=TRUE)
#}

# ヒストグラムを作成
#hist(y / n, breaks = seq(min(y/n), max(y/n), length.out = 100), freq = FALSE)

