#!/bin/bash

exec-mpc() {
    mpc $* &> /dev/null
}


case $BLOCK_BUTTON in
  1) exec-mpc toggle ;;
  2) exec-mpc stop   ;;
  3) showname=$((!$showname)); ;;
  4) exec-mpc pre    ;;
  5) exec-mpc next   ;;
esac

playing=
 paused=
stopped=" -"

song_remove_extension='{
	l=length($(NF)); tl=length($0);
	printf substr($0, 0, tl-l-1)
}'

TRAIL="->"
LENGTH=15

song_format_program='{
    l=length($0)

    if(l > len) {
        idx = timestamp % l; rdx = idx + len - l - 1
        printf "%s %s", substr($0, idx, len), substr($0, 0, rdx)
    }
    else { printf "%s", $0 }

    printf " %s  ", trail
}'

mpc current |
	sed "s/&/and/" |
	awk -F"/" '{printf $(NF)}' |
	awk -F"." "$song_remove_extension" |
    awk -v timestamp=$(date "+%s") \
        -v len=$LENGTH \
        -v trail=$TRAIL \
        "$song_format_program"

status=$(mpc status | sed -n 's/^\[\([^])]*\)\].*$/\1/p')
case $status in
  playing) echo $playing ;;
  paused)  echo $paused  ;;
  *)       echo $stopped ;;
esac

