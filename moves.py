# Outputs the player name and ELO 
from pgnparse import *
import sys
for f in sys.argv:
    p = PgnParser()
    p.parse(f)
    for game in p.db.games:        
        movelen = len(game.moves)
        if(movelen >= 5):
            i=0
            while(i < 4):
                print game.moves[i][0] + "," +game.moves[i][1] + ",",
                i+=1 
            print game.moves[i][0] + "," + game.moves[i][1]
        


