#!/bin/bash
LOG="$(./.createlog.sh)"

USER=familjenbackup

DIR=Advan

SOURCE=/home/johan/Programming/

DESTINATION=/media/lvm/samba/share/

HOST=192.168.0.178

LOGLIMIT=3

HOSTSTATUS="$(./.waitforhost.sh)"
HOSTEXIT=$?

if [ "$HOSTEXIT" -eq 0 ]
then
	OUTPUT="$HOSTSTATUS""$(rsync -avzi "$SOURCE""$DIR" "$USER"@"$HOST":"$DESTINATION"  2>&1)"
	# should check exit code of previous operation first
	ssh "$USER"@"$HOST" chmod -R 770 "$DESTINATION""$DIR" && exit	
fi
if [ "$HOSTEXIT" -ne 0 ]
then
	OUTPUT="$HOSTSTATUS" 
fi

DATE="DATE: $(date -R)\n"

DELIMITER="\n------------------------------------\n"

if [ -f "$LOG" ] && [ "$(./.logcount.sh)" -gt "$LOGLIMIT" ]
then
#	while read p && [ "$p" != "------------------------------------" ]
#	do
#			echo "$p"
#	done <"$LOG"
	rm "$LOG"
	./.createlog.sh >/dev/null
fi

if [ -f "$LOG" ] && [ "$(./.logcount.sh)" -le "$LOGLIMIT" ]
then 
	echo -e "$DATE" >> "$LOG"
	echo -e "$OUTPUT" >> "$LOG"
	echo -e "$DELIMITER" >> "$LOG"
fi
