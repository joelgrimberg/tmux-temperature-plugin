#!/usr/bin/env bash

TEMP="$( curl -s http://192.168.1.229:3005 | jq .tmp)"

get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}
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


main() {
  interpolate "status-right"
  interpolate "status-left"
}

main
