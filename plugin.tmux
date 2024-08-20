#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/scripts/local_temp.sh

TEMP="$( curl -s http://192.168.1.229:3005 | jq .tmp)"

do_interpolation() {
	local string="$1"
	local interpolated="${string/$TEMP}"
	echo "$interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

#curling the temp API
interpolate() {
    value="$(get_tmux_option "$option")"
	  local option="$1"
	  local option_value="$(get_tmux_option "$option")"
	  local new_option_value="$(do_interpolation "$option_value")"
	  set_tmux_option "$option" "$new_option_value"

}


temp() {
  interpolate "status-right"
  interpolate "status-left"
}

temp
