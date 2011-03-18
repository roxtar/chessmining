opar = par(mfrow = c(1, 2))
humans.table <- read.csv("../humans/humans_blitz_rating.csv", header=T)
humans <- na.exclude(humans.table)
humans <- humans[humans$BlitzRD < 60, ]

xcolors <- ifelse(humans$BlitzRating > 1500, "red", "gray")

plot(humans$BlitzRating ~ humans$BlitzRD, col=xcolors, pch=20, ylab="Blitz Rating", xlab="Blitz RD")
legend("topleft", pch=c(20,20), col=c("red", "gray"), legend=c("Rating > 1500", "Rating < 1500"), cex=0.8)
plot(humans$BlitzRating ~ humans$BlitzTotal, col=xcolors, pch=20, ylab="Blitz Rating", xlab="Blitz Total")
legend("topright", pch=c(20,20), col=c("red", "gray"), legend=c("Rating > 1500", "Rating < 1500"), cex=0.8)


par(opar)

## print correlation matrix
print(round(cor(humans[, 2:7]), 2))
pairs(humans[4:6], col="blue", pch=20)
lm(formula = BlitzWon ~ BlitzLost + BlitzDrawn, data = humans)

      
