#/bin/bash

HOST="192.168.0.178"

REACHABLE=1

TIMEOUT=45

TIME1="$(date +%s)"

TIME2="$(date +%s)"



powerwake "$HOST" >/dev/null 2>&1

while [ "$REACHABLE" -ne 0 ] && [ $(($TIME2-$TIME1)) -lt "$TIMEOUT" ] ; do
	ping -c 1 "$HOST" 1>/dev/null
	REACHABLE=$?
	TIME2="$(date +%s)"
done

if [ "$REACHABLE" -ne 0 ]
then
	echo $HOST" unreachable with exit code "$REACHABLE"\n"	
fi
if [ "$REACHABLE" -eq 0 ]
then
        echo $HOST" reached. \n"      
fi

exit $REACHABLE
