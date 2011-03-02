# Outputs the player name and ELO 
from pgnparse import *
import sys
print "Player,Elo"
for f in sys.argv:
    p = PgnParser()
    p.parse(f)
    for game in p.db.games:
        print game.tags["White"] + "," + game.tags["WhiteElo"]
        print game.tags["Black"] + "," + game.tags["BlackElo"]
