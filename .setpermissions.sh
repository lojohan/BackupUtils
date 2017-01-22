#!/bin/bash
DIRECTORY=$1
chmod -R 770 "$DIRECTORY" 
#should take group as an argument
chgrp -R familjen "$DIRECTORY"
