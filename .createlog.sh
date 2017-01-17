#!/bin/bash
LOGFILE=log/rsync.log

if [ ! -f "$LOGFILE" ]
then
    touch "$LOGFILE"
fi

echo "$LOGFILE"
