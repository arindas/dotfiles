#!/bin/bash


exec-mpc() {
    mpc $* &> /dev/null
}


case $BLOCK_BUTTON in
  1) exec-mpc toggle ;;
  2) exec-mpc stop   ;;
  3) showname=$((!$showname)); ;; # echo $showname > $SHOWNAME_PATH ;;
  4) exec-mpc pre    ;;
  5) exec-mpc next   ;;
esac

playing=
 paused=
stopped=" -"

song_remove_extension='
{
	l=length($(NF)); tl=length($0);
	printf substr($0, 0, tl-l-1)
}
'

song_format_program='
{
	l=length($0);
	if (l > 20) {
		printf "%s... %s ",
			substr($0, 0, 11),
			substr(substr($0, l-20), 0, 9)
	} 
	
	else { 
		printf "%s ", substr($0, 0, 20) 
	} 
}
'

mpc current |
	sed "s/&/and/" |
	awk -F"/" '{printf $(NF)}' |
	awk -F"." "$song_remove_extension" |
	awk "$song_format_program"

status=$(mpc status | sed -n 's/^\[\([^])]*\)\].*$/\1/p')
case $status in
  playing) echo $playing ;;
  paused)  echo $paused  ;;
  *)       echo $stopped ;;
esac

