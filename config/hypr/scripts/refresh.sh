#!/bin/bash

_ps=(waybar rofi swaync)
for _prs in "${_ps[@]}"; do
  if pidof "${_prs}" > /dev/null;then
    pkill "${_prs}"
  fi 
done

waybar &
sleep 0.5
swaync > /dev/null 2>&1 &
exit 0
