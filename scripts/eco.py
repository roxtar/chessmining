# Outputs the player name and ELO 
from pgnparse import *
import sys
print "WhiteElo, BlackElo, ECO"
for f in sys.argv:
    p = PgnParser()
    p.parse(f)
    for game in p.db.games:
        if("ECO" in game.tags.keys()):
            print game.tags["WhiteElo"] + "," + game.tags["BlackElo"] + "," + game.tags["ECO"];




