#!/bin/bash

STATE_FILE=/tmp/tmux-pomodoro-status

# If not already detached, fork and disown
if [[ -z "$DETACHED" ]]; then
  DETACHED=1 nohup "$0" "$@" >/dev/null 2>&1 < /dev/null &
  exit 0
fi

# Kill other instances (excluding this one)
pgrep -f "$0" | grep -v $$ | xargs -r kill

mode=$1
minutes=$2

end_time=$(( $(date +%s) + minutes * 60 ))

while [ "$(date +%s)" -le "$end_time" ]; do
    remaining=$(( end_time - $(date +%s) ))
    mins=$(( remaining / 60 ))
    secs=$(( remaining % 60 ))
    printf "%s %02d:%02d\n" "$mode" "$mins" "$secs" > "$STATE_FILE"
    sleep 1
done

exit 0
