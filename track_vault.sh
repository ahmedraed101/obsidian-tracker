#!/bin/bash

source ~/.keychain/$HOSTNAME-sh

cd "$(dirname "$0")"

echo "Start track of $(pwd) at $(date)"

LOG_DIR="$HOME/logs"
mkdir -p "$LOG_DIR"

gitstatus=$(git status --porcelain)
echo -e "$gitstatus"

if [[ -n $gitstatus ]]; then
    commitmessage="$(date +'%a %b(%m) %d %Y %I-%M-%S %p')"
    echo $commitmessage
    
    git add .
    git commit -m "$commitmessage"
    git push
fi


echo "End track of $(pwd) at $(date)"
