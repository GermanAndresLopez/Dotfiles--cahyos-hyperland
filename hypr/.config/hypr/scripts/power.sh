#!/bin/bash
case $1 in
    shutdown) systemctl poweroff ;;
    reboot) systemctl reboot ;;
    logout) hyprctl dispatch exit ;;
    suspend) systemctl suspend ;;
esac
