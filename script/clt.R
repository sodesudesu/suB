# 2023/11/21
# 中心極限定理の実験

# 変数をリセット
rm(list = ls())

# 1~6の一様乱数
x = runif(100, 1, 7)

# 回数
n = 1000000 # 標本数
m = 1000000 # 各標本の要素数

y = 0
for (i in 1:n){
    y = y + sample(1:6, n, replace=TRUE)
}

# ヒストグラムを作成
hist(y / n, freq=FALSE)
