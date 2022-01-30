#!/bin/bash

IP_ADDRESS=$(ip route get 1 | awk '{print $7}')

if [[ "${IP_ADDRESS}" != "" ]]; then
  echo "${IP_ADDRESS}"
fi
