#!/bin/bash
perl `dirname $0`/telnet.pl $1 | sed -e "s/\r/\n/" | perl `dirname $0`/clean_finger.pl > $2




