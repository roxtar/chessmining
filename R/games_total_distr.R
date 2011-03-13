## Plots the histogram of total games played for humans
## and computers

plotTotalHist <- function(total, title) {
  x <- na.exclude(total)
  h <- hist(x, breaks=40, col="gray", xlab="Total", main=title)
  lines(h$mids, h$counts, col="red")
}

humans.table <- read.csv("../humans/humans_blitz_rating.csv", header=T)
computers.table <- read.csv("../computers/computers_blitz_rating.csv", header=T)

humans.pruned <- humans.table$BlitzTotal[humans.table$BlitzTotal < 60000]
computers.pruned <- computers.table$BlitzTotal[computers.table$BlitzTotal < 200000]

opar <- par(mfrow=c(1,2))
plotTotalHist(humans.pruned, "Humans Total")
plotTotalHist(computers.pruned, "Computers Total")
par(opar)
