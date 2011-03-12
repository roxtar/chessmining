## Finds cheaters through frequent pattern mining
library(arules)
trans <- read.transactions("../computers/inemuri_loss_white.csv", sep=",", col=1, rm.duplicates=T)
rules <- apriori(trans, parameter = list(sup=0.05, conf = 0.6, target="rules", minlen=2, maxlen=2))

itemFrequencyPlot(trans, support=0.10, cex.names=0.8, col="red")

