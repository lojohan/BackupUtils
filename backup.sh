#!/bin/bash
LOG="$(./.createlog.sh)"

USER=familjenbackup

DIR=rsynctest

SOURCE=/home/johan/Desktop/

DESTINATION=/media/lvm/samba/share/

HOST=192.168.0.178

HOSTSTATUS="$(./.waitforhost.sh)"
HOSTEXIT=$?

if [ "$HOSTEXIT" -eq 0 ]
then
	OUTPUT="$HOSTSTATUS""$(rsync -avzi "$SOURCE""$DIR" "$USER"@"$HOST":"$DESTINATION"  2>&1)"
	# should check exit code of previous operation first
	ssh "$USER"@"$HOST" "chmod -R 770 "$DESTINATION""$DIR" ; chgrp -R familjen "$DESTINATION""$DIR" && exit"
fi
if [ "$HOSTEXIT" -ne 0 ]
then
	OUTPUT="$HOSTSTATUS" 
fi

DATE="DATE: $(date -R)\n"

DELIMITER="\n------------------------------------\n"

if [ -f "$LOG" ]
then 
	echo -e "$DATE" >> "$LOG"
	echo -e "$OUTPUT" >> "$LOG"
	echo -e "$DELIMITER" >> "$LOG"
fi
