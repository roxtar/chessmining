#!/bin/bash
perl telnet.pl $1| perl -pe "s/ \d+:.*//g" | perl -pe "s/^$//g" | tee -a finger.txt



