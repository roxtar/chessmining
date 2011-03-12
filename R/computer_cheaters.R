## Finds cheaters through frequent pattern mining
library(arules)
trans <- read.transactions("../computers/inemuri_loss_white.csv", sep=",", col=1, rm.duplicates=T)
rules.inemuri.white <- apriori(trans, parameter = list(sup=0.05, conf = 0.6, target="rules", minlen=2, maxlen=2))

trans <- read.transactions("../computers/inemuri_loss_black.csv", sep=",", col=1, rm.duplicates=T)
rules.inemuri.black <- apriori(trans, parameter = list(sup=0.05, conf = 0.6, target="rules", minlen=2, maxlen=2))

trans <- read.transactions("../computers/mscp_loss_black.csv", sep=",", col=1, rm.duplicates=T)
rules.mscp.black <- apriori(trans, parameter = list(sup=0.05, conf = 0.6, target="rules", minlen=2, maxlen=2))



trans <- read.transactions("../computers/IFDThor_loss_white.csv", sep=",", col=1, rm.duplicates=T)
rules.ifdthor.white <- apriori(trans, parameter = list(sup=0.01, conf = 0.6, target="rules", minlen=2, maxlen=2))

print(inspect(sort(rules.inemuri.white)[1:10]))
print(inspect(sort(rules.inemuri.black)[1:10]))
print(inspect(sort(rules.mscp.black)[1:10])
print(inspect(sort(rules.ifdthor.white)[1:10]))







