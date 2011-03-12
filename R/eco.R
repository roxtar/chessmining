eco <- read.csv("../humans/humans_eco.csv", header=T)
eco.table <- table(eco$ECO)
eco.table <- sort(eco.table, decreasing=T)
barplot(eco.table[1:20], col="gray", cex.names=1, ylab="Frequency", xlab="ECO")
readline("Hit <Enter> to see the next plot")

## Choose above average players

opar <- par(mfrow=c(1,2))
eco.above <- eco[eco$WhiteElo > 1800, ]$ECO
eco.above <- table(eco.above)
eco.above <- sort(eco.above, decreasing=T)
barplot(eco.above[1:5], col="gray", main="Rating > 1800", ylab="Frequency")

eco.below <- eco[eco$WhiteElo < 1300, ]$ECO
eco.below <- table(eco.below)
eco.below <- sort(eco.below, decreasing=T)
barplot(eco.below[1:5], col="gray", main="Rating < 1300", ylab="Frequency")
par(opar)
