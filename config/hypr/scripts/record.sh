#!/bin/bash

OUTPUT_FILE="$HOME/Videos/record-$(date +%Y-%m-%d_%H-%M-%S).mp4"
TIMER_FILE="/tmp/record_timer"

if pgrep wf-recorder >/dev/null; then
    pkill -SIGTERM wf-recorder
    rm -f "$TIMER_FILE"
    notify-send "Screen Recording" "Stopped recording."
else
    wf-recorder --audio=alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo.monitor -r 60 -f "$OUTPUT_FILE" &
    touch "$TIMER_FILE"
    notify-send "Screen Recording" "Recording started"
fi

