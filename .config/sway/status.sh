#!/bin/sh

echo "VOL $(pamixer --get-volume)% | BAT $(cat /sys/class/power_supply/BAT1/capacity)% | $(date +'%Y-%m-%d %X')"
