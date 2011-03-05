computers.table <- read.csv("computers_blitz.csv", header=T)





hist(computers.table$BlitzRating, breaks=20)
readline("Hit <enter> to see next plot");
hist(computers.table$BlitzRD, breaks=20)
readline("Hit <enter> to see next plot");
hist(computers.table$BlitzTotal[computers.table$BlitzTotal < 20000])
max <- which(computers.table$BlitzTotal == max(computers.table$BlitzTotal))
print(computers.table$Handle[116])
source("PCAplot.R")
xcolors <- ifelse(computers.table$BlitzRating > 2500, "red", "gray")
xnames <- rep("", nrow(computers.table))
PCAplot(computers.table[, 2:6], xnames, xcolors)
readline("Hit <enter> to see next plot");
plot(computers.table$BlitzRating ~ computers.table$BlitzRD, col=xcolors, pch=20)

