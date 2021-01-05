#!/bin/sh
LOCKER=slock
LOCK_TIMEOUT=5

function start_quake {
    while true; do
        guake --no-startup-script
        if [ $? -ne 0 ]; then
            echo "Error"
        fi
    done &
}

function base_start {
    xautolock -notify 30 -notifier "notify-send --expire-time=29000 'LOCKING in 30s'" -time $LOCK_TIMEOUT -locker $LOCKER -corners "----" -cornersize 30 &
    echo 3 > /tmp/libinput_discrete_deltay_multiplier
}

function start_programs {
    sxhkd  &
    thunar --daemon
}

base_start
start_programs
start_quake
