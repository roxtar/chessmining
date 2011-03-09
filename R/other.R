source("PCAplot.R")
humans.table <- read.csv("../humans/humans_blitz_rating.csv", header=T)
computers.table <- read.csv("../computers/computers_blitz_rating.csv", header=T)

select <- sample(humans.table$BlitzRD < 200, 100)
humans <- humans.table[select, ]
humans <- na.exclude(humans)

xcolors <- ifelse(humans$BlitzRating > 1500, "red", "gray")
xnames <- rep("", nrow(humans))
#PCAplot(humans[, 2:6], xnames, xcolors)
#readline("Hit <enter> to see next plot");
humans <- humans[humans$BlitzRD < 60, ]
plot(humans$BlitzRating ~ humans$BlitzRD, col=xcolors, pch=20)

