#!/bin/sh

function getTabs() {
osascript << EOF
    set _output to ""
    tell application "Google Chrome"
        set _window_index to 1
        repeat with w in windows
            set _tab_index to 1
            repeat with t in tabs of w
                set _title to get title of t
                set _url to get URL of t
                set _output to (_output & _window_index & "\t" & _tab_index & "\t" & _title & "\t" & _url & "\n")
                set _tab_index to _tab_index + 1
            end repeat
            set _window_index to _window_index + 1
            if _window_index > count windows then exit repeat
        end repeat
    end tell
    return _output
EOF
}

function setActiveTab() {
local _window_index=$1
local _tab_index=$2
osascript -- - "$_window_index" "$_tab_index" << EOF
on run argv
    set _window_index to item 1 of argv
    set _tab_index to item 2 of argv
    tell application "Google Chrome"
        activate
        set index of window (_window_index as number) to (_window_index as number)
        set active tab index of window (_window_index as number) to (_tab_index as number)
    end tell
end run
EOF
}

function main() {
    local tabs=$(getTabs)
    local title=$(echo "${tabs}" | awk -F '\t' '{print $3}' | fzf)
    local window_index tab_index
    read window_index tab_index <<< "$(echo "${tabs}" | grep -F "${title}" | head -n 1 | awk -F '\t' '{print $1, $2}')"
    setActiveTab $window_index $tab_index
}

main
