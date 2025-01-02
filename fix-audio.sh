#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file="$1"
temp_file="${input_file%.*}_temp.${input_file##*.}"

ffmpeg -i "$input_file" -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 \
  -c:v copy -c:a aac -shortest "$temp_file" &&
  mv "$temp_file" "$input_file"
