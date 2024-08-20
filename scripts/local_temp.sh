#!/usr/bin/env bash

#curling the temp API

TEMP="$( curl -s http://192.168.1.229:3005 | jq .tmp)"
tmux bind-key T run-shell "$CURRENT_DIR/scripts/local_temp.sh"
