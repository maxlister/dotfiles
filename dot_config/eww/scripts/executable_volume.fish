#!/usr/bin/env fish

set volume_value (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
echo (math --scale=0 "$volume_value * 100")
