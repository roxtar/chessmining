#!/bin/bash
computers=`cat computer_list.txt`
> finger.txt
for i in $computers; 
do 
    curl "http://www.ficsgames.com/cgi-bin/search.cgi?player=${i}&fingeruser=Finger" | grep "courier" | sed -e "s/\&nbsp;/ /g" | perl -pe "s/<br>/\n/g" | perl -pe "s/<\/?FONT.*>//g" | perl -pe "s/ \d+:.*//g" | perl -pe "s/^$//g" | tee -a finger.txt
done
