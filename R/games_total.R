## Plots the histogram of total games played for humans
## and computers

plotTotalHist <- function(total, title) {
  x <- na.exclude(total)
  print(mean(x))
  print(sd(x))
  h <- hist(x, breaks=20, col="gray", xlab="Total", main=title)
}

humans.table <- read.csv("../humans/humans_blitz_rating.csv", header=T)
computers.table <- read.csv("../computers/computers_blitz_rating.csv", header=T)

opar = par(mfrow=c(1,2))

plot(humans.table$BlitzTotal, col="blue", pch=20, ylab="Total", main="Humans")
plot(computers.table$BlitzTotal, col="red", pch=20, ylab="Total", main="Computers")
par(opar)

maxHuman <- max(humans.table$BlitzTotal, na.rm=T)
maxComp <- max(computers.table$BlitzTotal, na.rm=T)
maxHumanIdx <- which(humans.table$BlitzTotal == maxHuman)
maxCompIdx <- which(computers.table$BlitzTotal == maxComp)

print(paste("Highest total (Human): ", maxHuman, humans.table[maxHumanIdx,]$Handle));
print(paste("Highest total (Computer): ", maxComp, computers.table[maxCompIdx,]$Handle));
print(mean(humans.table$BlitzTotal, na.rm=T))
print(mean(computers.table$BlitzTotal))
#readline("Hit <enter> to see next plot:")
#plotTotalHist(humans.table$BlitzTotal, "Humans Total")
#plotTotalHist(computers.table$BlitzTotal, "Computers Total")
