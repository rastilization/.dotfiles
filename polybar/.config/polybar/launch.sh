#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch polybar
echo "---" | tee -a /tmp/polybar.log
polybar -c ~/.config/polybar/config whatever 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
