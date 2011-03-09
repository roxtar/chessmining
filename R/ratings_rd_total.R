opar = par(mfrow = c(1, 2))
humans.table <- read.csv("../humans/humans_blitz_rating.csv", header=T)
humans <- na.exclude(humans.table)
humans <- humans[humans$BlitzRD < 60, ]

xcolors <- ifelse(humans$BlitzRating > 1500, "red", "gray")

plot(humans$BlitzRating ~ humans$BlitzRD, col=xcolors, pch=20, ylab="Blitz Rating", xlab="Blitz RD")
plot(humans$BlitzRating ~ humans$BlitzTotal, col=xcolors, pch=20, ylab="Blitz Rating", xlab="Blitz Total")


