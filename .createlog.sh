#!/bin/bash
LOGFILE=log/rsync"$(date +%F-%H:%M:%S)".log

if [ ! -f "$LOGFILE" ]
then
    touch "$LOGFILE"
fi

echo "$LOGFILE"
