#!/usr/bin/env fish

set wallpaper $HOME/Wallpapers/Paint-it-Black.png

swaybg -i $wallpaper -m fill &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
wl-paste --primary --watch cliphist store &
eww open bar &
mpd &
$XDG_CONIG_HOME/river/scripts/lock.fish &
