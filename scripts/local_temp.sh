#!/usr/bin/env bash

#CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#tmux bind-key T run-shell "$CURRENT_DIR/scripts/local_temp.sh"

#curling the temp API

TEMP="$( curl -s http://192.168.1.229:3005 > /dev/null | jq .tmp)"
tmux bind-key T run-shell "$CURRENT_DIR/scripts/local_temp.sh"
