#!/bin/bash

input_dir="$1"
output="/home/homeassistant/.homeassistant/radio_station_buttons.yaml"

echo "# This file is generated automatically, do not edit it by hand" > $output

for entry in $input_dir/*
do
  nopath=${entry##*/}
  noextension=${nopath%.*}
  echo "- name: $noextension" >> $output
  echo "  type: source" >> $output
  echo "  id: \"$noextension\"" >> $output
done
