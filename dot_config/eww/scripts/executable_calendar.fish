#!/usr/bin/env fish

set LOCK_FILE "$XDG_DATA_HOME/eww/calendar.lock"

if not pgrep eww > /dev/null
    eww daemon
    sleep 1
end

if not test -f $LOCK_FILE
    touch $LOCK_FILE
    eww open calendar
else
    eww close calendar
    rm $LOCK_FILE
end
