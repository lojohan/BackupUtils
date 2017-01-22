#!/bin/bash
LOG="$(./.createlog.sh)"

USER=familjenbackup

DIR=rsynctest

SOURCE=/home/johan/Desktop/

DESTINATION=/media/lvm/samba/share/

CHM=770

GRP=familjen

HOST=192.168.0.178

HOSTSTATUS="$(./.waitforhost.sh)"
HOSTEXIT=$?

if [ "$HOSTEXIT" -eq 0 ]
then
	RSYNC="$HOSTSTATUS""$(rsync -avzi "$SOURCE""$DIR" "$USER"@"$HOST":"$DESTINATION"  2>&1)"
	SETPERMS="$(./.setpermissions.sh "$USER" "$HOST" "$DESTINATION" "$DIR" "$CHM" "$GRP")"
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
	echo -e "$RSYNC" >> "$LOG"
	echo -r "$SETPERMS" >> "$LOG"
	echo -e "$DELIMITER" >> "$LOG"
fi
