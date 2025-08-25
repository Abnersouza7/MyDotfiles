#!/bin/bash

option=$(echo -e " Shutdown\n Reboot\n Logout" | rofi -dmenu -p "Power")

case $option in
" Shutdown")
  shutdown now
  ;;
" Reboot")
  reboot
  ;;
" Logout")
  hyprctl dispatch exit
  ;;
esac
