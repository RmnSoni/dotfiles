#!/bin/bash

STATE_FILE="/tmp/caffeine_enabled"

if pgrep -x "swayidle" >/dev/null; then
    pkill swayidle
    echo "off" >"$STATE_FILE"
else
    swayidle -w timeout 3600 'true' &
    echo "on" >"$STATE_FILE"
fi
