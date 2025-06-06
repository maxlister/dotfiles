#!/usr/bin/env fish
# This is the example configuration file for river.
#
# If you wish to edit this, you will probably want to copy it to
# $XDG_CONFIG_HOME/river/init or $HOME/.config/river/init first.
#
# See the river(1), riverctl(1), and rivertile(1) man pages for complete
# documentation.
# Note: the "Super" modifier is also known as Logo, GUI, Windows, Mod4, etc.

riverctl spawn "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river"
riverctl spawn "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river"
riverctl spawn "$XDG_CONFIG_HOME/river/scripts/lock.fish"
riverctl spawn "wl-paste --watch cliphist store"
riverctl spawn "swaybg -i ~/Wallpapers/Paint-it-Black.png -m fill"

riverctl map normal Super Return spawn ghostty
# Super+Q to close the focused view
riverctl map normal Super Q close
riverctl map normal Super D spawn fuzzel
# Super+Shift+E to exit river
riverctl map normal Super+Shift E exit

riverctl map normal Super H focus-view left
riverctl map normal Super J focus-view down
riverctl map normal Super K focus-view up
riverctl map normal Super L focus-view right
riverctl map normal Super P focus-view previous
riverctl map normal Super N focus-view next

riverctl map normal Super+Shift H swap left
riverctl map normal Super+Shift J swap down
riverctl map normal Super+Shift K swap up
riverctl map normal Super+Shift L swap right
riverctl map normal Super+Shift P swap previous
riverctl map normal Super+Shift N swap next

# Super+Period and Super+Comma to focus the next/previous output
riverctl map normal Super Period focus-output next
riverctl map normal Super Comma focus-output previous

# Super+Shift+{Period,Comma} to send the focused view to the next/previous output
riverctl map normal Super+Shift Period send-to-output next
riverctl map normal Super+Shift Comma send-to-output previous

# Super+Shift+Return to bump the focused view to the top of the layout stack
riverctl map normal Super+Shift Return zoom

# Super+Alt+{H,J,K,L} to move views
riverctl map normal Super+Alt H move left 100
riverctl map normal Super+Alt J move down 100
riverctl map normal Super+Alt K move up 100
riverctl map normal Super+Alt L move right 100

# Super+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right

# Super+Alt+Shift+{H,J,K,L} to resize views
riverctl map normal Super+Alt+Shift H resize horizontal -100
riverctl map normal Super+Alt+Shift J resize vertical 100
riverctl map normal Super+Alt+Shift K resize vertical -100
riverctl map normal Super+Alt+Shift L resize horizontal 100

# Super + Left Mouse Button to move views
riverctl map-pointer normal Super BTN_LEFT move-view

# Super + Right Mouse Button to resize views
riverctl map-pointer normal Super BTN_RIGHT resize-view

# Super + Middle Mouse Button to toggle float
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

for i in (seq 1 9)
    # Fish uses math for bit shifting
    set tags (math "2^($i - 1)")
    
    # Super+[1-9] to focus tag [0-8]
    riverctl map normal Super $i set-focused-tags $tags
    
    # Super+Shift+[1-9] to tag focused view with tag [0-8]
    riverctl map normal Super+Shift $i set-view-tags $tags
    
    # Super+Control+[1-9] to toggle focus of tag [0-8]
    riverctl map normal Super+Control $i toggle-focused-tags $tags
    
    # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
    riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
end

# Super+0 to focus all tags
# Super+Shift+0 to tag focused view with all tags
set all_tags (math "2^32 - 1")
riverctl map normal Super 0 set-focused-tags $all_tags
riverctl map normal Super+Shift 0 set-view-tags $all_tags

# Super+Space to toggle float
riverctl map normal Super Space toggle-float

# Super+F to toggle fullscreen
riverctl map normal Super F toggle-fullscreen

# Super+{Up,Right,Down,Left} to change layout orientation
riverctl map normal Super Up    send-layout-cmd bsp-layout "main-location top"
riverctl map normal Super Right send-layout-cmd bsp-layout "main-location right"
riverctl map normal Super Down  send-layout-cmd bsp-layout "main-location bottom"
riverctl map normal Super Left  send-layout-cmd bsp-layout "main-location left"

# Declare a passthrough mode. This mode has only a single mapping to return to
# normal mode. This makes it useful for testing a nested wayland compositor
riverctl declare-mode passthrough

# Super+F11 to enter passthrough mode
riverctl map normal Super F11 enter-mode passthrough

# Super+F11 to return to normal mode
riverctl map passthrough Super F11 enter-mode normal

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
for mode in normal locked
    # Eject the optical drive (well if you still have one that is)
    riverctl map $mode None XF86Eject spawn 'eject -T'
    
    # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
    riverctl map $mode None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
    riverctl map $mode None XF86AudioLowerVolume  spawn 'pamixer -d 5'
    riverctl map $mode None XF86AudioMute         spawn 'pamixer --toggle-mute'
    
    # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
    riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
    riverctl map $mode None XF86AudioNext  spawn 'playerctl next'
    
    # Control screen backlight brightness with brightnessctl (https://github.com/Hummer12007/brightnessctl)
    riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +5%'
    riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
end

#Screenshotting
riverctl map normal None Print spawn "$XDG_CONFIG_HOME/river/scripts/screenshot.fish"

#Clipboard
riverctl map normal Control+Super V spawn "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

riverctl border-width 2

# Start flavours
riverctl background-color 0x1d2021ff
riverctl border-color-focused 0x8ec07cff
riverctl border-color-unfocused 0x1d2021ff
# End flavours

# Set keyboard repeat rate
riverctl set-repeat 50 300

# Make all views with an app-id that starts with "float" and title "foo" start floating.
riverctl rule-add -app-id 'float*' -title 'foo' float

# Make all views with app-id "bar" and any title use client-side decorations
riverctl rule-add -app-id "bar" csd
riverctl rule-add -app-id "Firefox" ssd
riverctl rule-add -app-id "ghostty" ssd

way-displays > /tmp/way-displays.$XDG_VTNR.$USER.log 2>&1 &

# Set the default layout generator to be rivertile and start it.
# River will send the process group of the init executable SIGTERM on exit.
riverctl default-layout bsp-layout
river-bsp-layout -i 5 -o 10 --split-perc 0.5 --reverse &
