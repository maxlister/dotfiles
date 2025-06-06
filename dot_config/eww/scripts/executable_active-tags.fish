#!/usr/bin/env fish

river-bedload -minified -watch active | while read line
    if test -z $line
        continue
    end
    echo $line | jq -c '
        [.[] | select(.output == "DP-2")]
        | map({
            key: (.id | tostring),
            value: {focused, occupied, urgent}
        })
        | from_entries
    '
end
