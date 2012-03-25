#!/bin/bash

HOST=satiani-vm
LOG_FILE=$HOME/async-scp.log
# assign fd1 (previously stdout) to the logfile, and redirect fd2 (stderr) to fd1
# so all errors are logged to the logfile.
exec >$LOG_FILE 2>&1
SOURCE=$1
#remove OS X style home directory path from the destination path
DEST=${1/Users/home}
SSH_MUX_SOCKET=~/.ssh/async-scp.socket


(if [ ! -w $SSH_MUX_SOCKET ]; then
    echo "Starting the Master SSH connection for the first time.." 
    ssh -N -f -M -S $SSH_MUX_SOCKET $HOST
fi
/usr/bin/time scp -v -o "ControlPath $SSH_MUX_SOCKET" $1 $HOST:$DEST
# close fd1
exec >&-
) &
