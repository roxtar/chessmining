games <- read.csv("playerelo_feb_27_2011_blitz.csv", header=T)
summary(games$Elo)
players <- table(games$Player)
hist(players, breaks=3)
readline("Hit <Enter> to see the next Plot")
hist(games$Elo, breaks=20, col="green")
