#!/bin/bash
DIRECTORY=$1
chmod -R 770 "$DIRECTORY" 
#should take group and host as arguments
chgrp -R familjen "$DIRECTORY"
