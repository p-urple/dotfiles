#!/bin/bash

file="Screenshot $(date +"%Y-%m-%d %H:%M:%S").png"
scrot "$file" -e 'mv "$f" /tmp/'
xclip -sel clip -t image/png /tmp/"$file"
notify-send "SNAP! Yep. This is going in my cringe compilation."
