#!/usr/bin/env bash

sleep 1

MONITORS=$(hyprctl monitors -j)

# 1. Prefer external monitors (DP / HDMI)
MONITOR=$(echo "$MONITORS" | jq -r '
  .[] | select(.name | test("DP|HDMI")) | .name
' | head -n1)

# 2. Fallback to any monitor
if [ -z "$MONITOR" ]; then
  MONITOR=$(echo "$MONITORS" | jq -r '.[0].name')
fi

exec waybar -o "$MONITOR"
