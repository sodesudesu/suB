# itunesの再生回数を確かめる。
# 2023/11/13

rm(list=ls())

### csvの読み込み
data = read.csv("../data/music.csv")

### データの構造をみる
str(data)

### アーティストごとに再生数を合計する
count = tapply(data$再生回数, data$アーティスト, sum, na.rm=TRUE)
count = data.frame(artist=names(count), plays=count)
count = count[order(count$plays, decreasing=TRUE),]
count = head(count, 20)
count = count[order(count$plays, decreasing=FALSE),]

### 棒グラフを作成
png("../fig/music.png", width=640, height=480, type="cairo")
par(mar = c(5, 10, 4, 2) + 0.1)
barplot(count$plays, names.arg=count$artist, las=1, horiz=TRUE, main="アーティスト別再生数（上位20組）")
dev.off()

### Mr.Childrenを集計
MrChildren = subset(data, アーティスト=="Mr.Children")
MrChildren = MrChildren[order(MrChildren$再生回数, decreasing=TRUE),]
MrChildren = head(MrChildren, 30)  # 上位30曲
MrChildren = MrChildren[order(MrChildren$再生回数, decreasing=FALSE),]

png("../fig/MrChildren.png", width=640, height=780, type="cairo")
par(mar = c(5, 14, 4, 2) + 0.1)
barplot(MrChildren$再生回数, names.arg = MrChildren$名前, las = 1, horiz = TRUE, main = "Mr.Children 再生回数上位30曲")
dev.off()
