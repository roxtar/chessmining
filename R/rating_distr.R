## Plots the ratings of human blitz rating and computer blitz rating
## Also prints the mean, sd and percentage above rating 2000

plotRatingHist <- function(rating, title) {
  x <- na.exclude(rating)
  print(mean(x));
  print(sd(x));
  h <- hist(x, breaks=20, col="gray", xlab="Rating", main=title)
  xfit <- seq(min(x), max(x), length=100)
  yfit <- dnorm(xfit, mean=mean(x), sd=sd(x))
  yfit <- yfit*diff(h$mids[1:2])*length(x)

  lines(xfit, yfit, col="red")
}

percHigher <- function(rating, val) {
  x <- na.exclude(rating)
  perc <- length(x[x >= val])/length(x)
  perc * 100
}

humans.table <- read.csv("../humans/humans_blitz_rating.csv", header=T)
computers.table <- read.csv("../computers/computers_blitz_rating.csv", header=T)

plotRatingHist(humans.table$BlitzRating, "Humans Rating")
readline("Hit <enter> to see next plot:")
plotRatingHist(computers.table$BlitzRating, "Computers Rating")

print(percHigher(humans.table$BlitzRating, 2000))
print(percHigher(computers.table$BlitzRating, 2000))

      




