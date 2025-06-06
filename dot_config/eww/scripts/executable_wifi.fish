#!/usr/bin/env fish

function symbol
    if test (cat /sys/class/net/w*/operstate) = "down"
        echo 󰤭
        exit
    else
        echo 󰤨
    end
end

function name
    nmcli | grep "^wlp" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2
end

switch $argv[1]
    case "icon"
        symbol
    case "name"
        name
end

