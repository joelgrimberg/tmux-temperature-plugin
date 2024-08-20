#!/usr/bin/env bash

focus_status_file() {
    local default="$HOME/.focus-status"
    local value
    value="$(tmux show-option -gqv "@focus-status-file")"
    echo "${value:-$default}"
}

tset() {
    tmux set-option -g "$@"
}

# Focus status text on left, window info on right
tset status-left "#(head -1 "$(focus_status_file)" 2> /dev/null)"
tset status-left-length 100
tset status-right ""
tset status-justify right

# Simple styling, current window is highlighted
tset status-style "fg=grey,bg=terminal"
tset window-status-style "dim"
tset window-status-current-style "bright"

# Window names reflect current dir there
tset automatic-rename on
tset automatic-rename-format "#{b:pane_current_path}"

# Sensible window numbering
tset base-index 1
tset renumber-windows on

# Given vim's status line at the bottom, put this status line at the top
tset status-position top
