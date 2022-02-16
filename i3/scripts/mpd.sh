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
    if (NF > 1) {
        extension_len = length($(NF)); total_len = length($0);
	    printf substr($0, 0, total_len - extension_len - 1)
    }

    else { printf $0 }
}'

LENGTH=15
TRAIL="->"

song_name_marquee='{
    l=length($0)

    if (l > len) {
        idx = timestamp % l; rdx = idx + len - l - 1
        printf "%s %s", substr($0, idx, len), substr($0, 0, rdx)
    }

    else { printf "%s", $0 }
}'

song_name_truncate='{
    l = length($0)

    if (l > len) {
        printf "%s... %s",
            substr($0, 0, len/2), substr($0, l - len/2)
    }

    else { printf "%s", $0 }
}'

SONG_NAME=$(mpc current |
    sed "s/&/and/" |
    awk -F"/" '{printf $(NF)}' |
    awk -F"." "$song_remove_extension" |
    awk -F"-" "$song_remove_extension")

WIDE_CHAR_ABSENT=$(echo -e $SONG_NAME |
    LANG=C sed -z '/[\x80-\xFF]/d')

if [[ ! -z $WIDE_CHAR_ABSENT ]]; then
    echo "$SONG_NAME" |
        awk -v timestamp=$(date "+%s") \
            -v len=$LENGTH \
            "$song_name_marquee"
else
    echo "$SONG_NAME" |
        awk -v len=$LENGTH \
            "$song_name_truncate"
fi

if [[ ! -z "$SONG_NAME" ]]; then
    printf " $TRAIL  ";
fi

status=$(mpc status | sed -n 's/^\[\([^])]*\)\].*$/\1/p')
case $status in
  playing) echo $playing ;;
  paused)  echo $paused  ;;
  *)       echo $stopped ;;
esac

