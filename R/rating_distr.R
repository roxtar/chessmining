plotRatingHist <- function(rating, title) {
  x <- na.exclude(rating)  
  h <- hist(x, breaks=20, col="gray", xlab="Rating", main=title)
  xfit <- seq(min(x), max(x), length=100)
  yfit <- dnorm(xfit, mean=mean(x), sd=sd(x))
  yfit <- yfit*diff(h$mids[1:2])*length(x)

  lines(xfit, yfit, col="red")
}

humans.table <- read.csv("../humans/humans_blitz_rating.csv", header=T)
computers.table <- read.csv("../computers/computers_blitz_rating.csv", header=T)

plotRatingHist(humans.table$BlitzRating, "Humans Rating")
readline("Hit <enter> to see next plot:")
plotRatingHist(computers.table$BlitzRating, "Computers Rating")





