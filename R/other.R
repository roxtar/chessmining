readline("Hit <enter> to see next plot");
hist(humans.table$BlitzRD)

readline("Hit <enter> to see next plot");
hist(humans.table$BlitzTotal[humans.table$BlitzTotal < 20000])
i <- which(humans.table$BlitzTotal == max(humans.table$BlitzTotal, na.rm=T))
print(humans.table[i,])
select <- humans.table$BlitzRD < 200
humans <- humans.table[select, ]
source("PCAplot.R")

xcolors <- ifelse(humans$BlitzRating > 1500, "red", "gray")
xnames <- rep("", nrow(humans))
PCAplot(humans.table[, 2:6], xnames, xcolors)
readline("Hit <enter> to see next plot");
plot(humans$BlitzRating ~ humans$BlitzRD, col=xcolors, pch=20)

