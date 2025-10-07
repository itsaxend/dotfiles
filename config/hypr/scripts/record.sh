#!/bin/bash

OUTPUT_FILE="$HOME/Videos/record-$(date +%Y-%m-%d_%H-%M-%S).mp4"

if pgrep wf-recorder >/dev/null; then
    pkill -SIGTERM wf-recorder
    notify-send -t 650 "Screen Recording" "Stopped recording."
else
    wf-recorder --audio=alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo.monitor --bitrate 50000 -c libx264rgb -r 144 -f "$OUTPUT_FILE" &
    notify-send -t 650 "Screen Recording" "Recording started"
fi

