# Outputs the player name and ELO 
from pgnparse import *
import sys
for f in sys.argv:
    p = PgnParser()
    p.parse(f)
    num_moves = 7
    for game in p.db.games:        
        movelen = len(game.moves)
        if(movelen >= num_moves):
            i=movelen - num_moves
            while(i < movelen-1):
                print game.moves[i][0] + "," +game.moves[i][1] + ",",
                i+=1 
            print game.moves[i][0] + "," + game.moves[i][1]
        


