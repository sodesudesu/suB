# 2024/1/6

rm(list=ls())

library(readxl)
library(tidyverse)

# ダウンロード先のディレクトリを指定
#download_dir <- "~/stat/class/"

# ファイルのURL（HTTPS経由）
#file_url <- "https://shibaura3-my.sharepoint.com/:x:/g/personal/aa21049_sic_shibaura-it_ac_jp/EbUljVDRgPxEu5VfvYV7zJMBXdbG1FW6MZC8HMxhKIWPtA?e=szFw5H"

# wget "https://shibaura3-my.sharepoint.com/:x:/g/personal/aa21049_sic_shibaura-it_ac_jp/EbUljVDRgPxEu5VfvYV7zJMBXdbG1FW6MZC8HMxhKIWPtA?e=szFw5H"


# ダウンロード
#download.file(file_url, destfile = paste0(download_dir, "coin.xlsx"), mode = "wb")

# excelの読み込み
coin = read_excel("coin.xlsx")

# 表と裏のベクトル
head = coin$heads
tail = 10 - coin$heads

#head = 0
#for (i in 1:10) {
#    head = head + sample(0:1, 1000, replace=TRUE)
#}

# 全体で表のと裏の回数を集計
png("coin1.png", width=1000, height=700)
c(sum(head, na.rm=TRUE), sum(tail, na.rm=TRUE)) %>%
    barplot()
dev.off()

# 正規近似
png("coin2.png", width=1000, height=700)
hist(head, breaks=seq(-0.5, 10.5, length.out=12), xlab="表の回数", ylab="", main="", freq=FALSE)
dev.off()

# 曲線を加える
png("coin3.png", width=1000, height=700)
hist(head, breaks=seq(-0.5, 10.5, length.out=12), xlab="表の回数", ylab="", main="", freq=FALSE)
curve(dnorm(x, mean=5, sd=sqrt(2.5)), 0, 10, col="red", lwd=4, add=TRUE)
dev.off()
