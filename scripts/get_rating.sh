#!/bin/bash

# Run get_rating.pl on the clean finger file. But only choose users
# who have played blitz games

perl `dirname $0`/get_rating.pl $1 | grep "," > $2