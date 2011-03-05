#!/bin/bash

# Run get_rating.pl on the clean finger file. But only choose computers 
# which have played blitz games

perl get_rating.pl finger_clean.txt | grep ","