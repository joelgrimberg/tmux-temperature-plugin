#!/usr/bin/env bash

#curling the temp API

TEMP="$( curl -s http://192.168.1.229:3005 | jq .tmp)"
echo $TEMP
