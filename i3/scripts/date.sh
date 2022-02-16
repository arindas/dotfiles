#!/bin/bash

ACTION="$HOME/.config/i3/scripts/calendar"

# handle button actions
case $BLOCK_BUTTON in
	1) # click
		$ACTION curr
	;;
	4) # scroll up
		$ACTION prev
	;;
	5) #scroll down
		$ACTION next
	;;
esac

# i3block
DATE=$(date '+%a, %d %b %Y')
echo "$DATE"
