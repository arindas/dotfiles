#!/bin/bash

ACCESS_POINT=$(LANG=C nmcli d | grep -w connected | grep -w wlan0 | awk '{print $NF}')

if [[ ! -z ${ACCESS_POINT} ]]; then
    echo $ACCESS_POINT
else
    echo "--"
fi
