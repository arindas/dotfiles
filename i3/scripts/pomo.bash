#!/bin/bash

pomo_output=$(pomo)
colr=$(echo "$pomo_output" | cut -d "=" -f2 - | cut -d "]" -f1 -)
text=$(echo "$pomo_output" | cut -d "]" -f2 -)
text="${text// /  }"
printf "%s\n\n%s\n" "$text" "$colr"
