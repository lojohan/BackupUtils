#!/bin/bash
if [ "$#" -lt 5 ]
then
	echo "Insufficient number of arguments"
	exit
fi

if [ "$#" -lt 6 ]
then
	USER=$1
	HOST=$2
	DESTINATION=$3
	DIR=$4
	CHM=$5

	ssh "$USER"@"$HOST" "chmod -R "$CHM" "$DESTINATION""$DIR" && exit"
fi

if [ "$#" -lt 7 ]
then
	USER=$1
        HOST=$2
        DESTINATION=$3
        DIR=$4
        CHM=$5
	GRP=$6

	ssh "$USER"@"$HOST" "chmod -R "$CHM" "$DESTINATION""$DIR" ; chgrp -R "$GRP" "$DESTINATION""$DIR" && exit"
fi

if [ "$#" -ge 7 ]
then 
	echo "Too many arguments"
fi
