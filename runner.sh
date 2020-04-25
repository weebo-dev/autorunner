#!/bin/bash
# Place SA's in /home/USER/sa/
# Name them 1.json 2.json so on, or change script to reflect your names.

COUNTERA=1
SOURCE1="srcrclone:/Folder"
DESTINATION1="dstrclone:/Folder"
RUNNERUSER="runner"

while [ $COUNTERA -lt 100 ]; do
echo Using service account $COUNTERA
/usr/bin/rclone copy -v -P -c --tpslimit 4 -c --checkers=8 --transfers=4 --fast-list --drive-chunk-size 128M --max-transfer 730G --stats 5s --drive-service-account-file=/home/$RUNNERUSER/sa/$COUNTERA.json --log-file=/home/$RUNNERUSER/runner1.log $SOURCE1 $DESTINATION1
let COUNTERA=COUNTERA+1
done
