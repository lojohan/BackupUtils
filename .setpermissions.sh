#!/bin/bash

if [ "$#" -lt 5 ]
then 
	echo -e "\nInsufficient number of arguments."
	exit

	elif [ "$#" -eq 5 ]
	then
		USER=$1
		HOST=$2
		DESTINATION=$3
		DIR=$4
		CHM=$5
	
		echo -e "\nAttempting to set permissions for directory: "$DESTINATION""$DIR""
		ssh "$USER"@"$HOST" "chmod -R "$CHM" "$DESTINATION""$DIR" && exit" && echo -e "\nSet permissions for directory: "$DESTINATION""$DIR""
	elif [ "$#" -eq 6 ]
	then
		USER=$1
	        HOST=$2
        	DESTINATION=$3
	        DIR=$4
	        CHM=$5
		GRP=$6

		echo -e "\nAttempting to set permissions for directory: "$DESTINATION""$DIR""
		ssh "$USER"@"$HOST" "chmod -R "$CHM" "$DESTINATION""$DIR" ; chgrp -R "$GRP" "$DESTINATION""$DIR" && exit" && echo -e "\nSet permissions and group for directory: "$DESTINATION""$DIR""
	elif [ "$#" -ge 7 ]
        then
                echo -r "\nToo many arguments."
		exit

fi
