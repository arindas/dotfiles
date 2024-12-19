#!/bin/bash

ACCESS_POINT=$(LANG=C nmcli dev | grep -w connected | grep wlan | awk '{print $(NF-1)}')

if [[ ! -z ${ACCESS_POINT} ]]; then
	echo $ACCESS_POINT
else
	echo "--"
fi
