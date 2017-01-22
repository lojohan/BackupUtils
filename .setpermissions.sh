#!/bin/bash
USER=$1
HOST=$2
DESTINATION=$3
DIR=$4
CHM=$5
GRP=$6

ssh "$USER"@"$HOST" "chmod -R "$CHM" "$DESTINATION""$DIR" ; chgrp -R "$GRP" "$DESTINATION""$DIR" && exit"
