#!/usr/bin/env bash
chosen=$(printf "  Shutdown\n  Reboot\n  Suspend\n  Lock\n  Logout" \
  | rofi -dmenu \
    -p "Power" \
    -theme-str 'window { width: 220px; } listview { lines: 5; }')

case "$chosen" in
  *Shutdown) systemctl poweroff ;;
  *Reboot)   systemctl reboot ;;
  *Suspend)  systemctl suspend ;;
  *Lock)     loginctl lock-session ;;
  *Logout)   hyprctl dispatch exit ;;
esac
