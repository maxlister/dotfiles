#!/usr/bin/env fish

swayidle -w \
timeout 120 'wlopm --off \*' \
timeout 300 'swaylock -F -l -i ~/Wallpapers/night-time.png' \
timeout 600 'systemctl suspend' \
resume 'wlopm --on \*' \
before-sleep 'swaylock -F -l -i ~/Wallpapers/night-time.png'
