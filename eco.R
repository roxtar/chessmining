eco <- read.csv("eco.csv", header=T)
eco.table <- table(eco$ECO)
eco.table <- sort(eco.table, decreasing=T)
barplot(eco.table[1:20], col=rainbow(20), cex.names=0.5)
readline("Hit <Enter> to see the next plot")

elo.mean <- (mean(eco$WhiteElo) + mean(eco$BlackElo))/2

## Choose above average players
print(elo.mean)
eco.above <- eco[eco$WhiteElo > 2000, ]$ECO
eco.above <- table(eco.above)
eco.above <- sort(eco.above, decreasing=T)
barplot(eco.above[1:20], col=rainbow(20), cex.names=0.5)
