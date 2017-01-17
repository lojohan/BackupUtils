#!/bin/bash
LOGFILE="$(./.createlog.sh)"
grep -o 'DATE' "$LOGFILE" | wc -l
