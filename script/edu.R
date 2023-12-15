rm(list=ls())

data = read.csv("../data/SSDSE-B-2023.csv")

data2020 = subset(data, 年度==2020)
data2020 = data.frame(pre=data2020$都道府県, ratio=data2020$高等学校卒業者のうち進学者数/data2020$高等学校卒業者数*100, fert=data2020$合計特殊出生率)

aca = data2020[order(data2020$ratio, decreasing=FALSE),]

png("../fig/edu1.png", width=640, height=780, type="cairo")
par(mar = c(5, 14, 4, 2) + 0.1)
barplot(aca$ratio, names.arg = aca$pre, las = 1, horiz = TRUE, main = "大学進学率2020")
dev.off()

png("../fig/edu2.png", width=600, height=600, type="cairo")
plot(NULL, xlim=c(1,2), ylim=c(30,80),
     xlab="合計特殊出生率", ylab="大学進学率")
text(aca$fert, aca$ratio, aca$pre)
dev.off()

cor(aca$fert, aca$ratio)
