#!/usr/bin/env fish

set options "Screenshot\nScreenshot to Clipboard"
set choice (echo -e "$options" | fuzzel --dmenu --prompt="Select Screenshot Option: ")

switch $choice
case "Screenshot"
	grim -g "$(slurp)"
case "Screenshot to Clipboard"
        grim -g "$(slurp)" - | wl-copy
case '*'
	echo "No valid option selected."
end
