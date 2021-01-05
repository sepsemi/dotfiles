#!/bin/bash

adjust_muteness() {
    clients=$(pactl list clients short | awk '/[0-9]+.*'$1'.*/{print $1}')
    inputs=$(pactl list sink-inputs short)
    for c in $clients; do
        for i in $(printf '%s' "$inputs" | awk '/[0-9]+\s[0-9]+\s'$c'/{print $1}'); do
            pactl set-sink-input-mute $i $2 &
        done
    done
}


function input_control {
    if [ $1 == 1 ]; then
        amixer -D pulse sset Capture toggle
    elif [ $1 == 2 ]; then
       amixer set Capture 10%+
    elif [ $1 == 3 ]; then
        amixer set Capture 10%-
    fi
}

function main {
    if [ $1 == 'input_control' ]; then
        input_control $2
    fi
}

main "$@"

