#!/bin/bash

IP=$(ifconfig -v utun4 | grep -oE 'inet\s(10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | awk '{print $2}')
isconnected=$(if ifconfig -v | grep -q "utun4"; then echo "true"; else echo "false"; fi)

if [[ $isconnected == "true" ]]; then
  sketchybar -m --set ips icon=􀨤 \
                          label="$IP" \
                          drawing=on
else
  sketchybar -m --set ips drawing=off
fi