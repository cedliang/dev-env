#!/usr/bin/env zsh

if pidof gammastep; then
   killall -9 gammastep
fi
gammastep -l -38:145 -m wayland -t 6500:4000
