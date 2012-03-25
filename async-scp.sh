#!/bin/bash

HOST=satiani-vm
LOG_FILE=$HOME/async-scp.log
exec >$LOG_FILE 2>&1
SOURCE=$1
DEST=${1/Users/home}
SSH_MUX_SOCKET=~/.ssh/async-scp.socket


(if [ ! -w $SSH_MUX_SOCKET ]; then
    echo "Starting the Master SSH connection for the first time.." 
    ssh -N -f -M -S $SSH_MUX_SOCKET $HOST
fi
/usr/bin/time scp -v -o "ControlPath $SSH_MUX_SOCKET" $1 $HOST:$DEST
exec <&-
) &
