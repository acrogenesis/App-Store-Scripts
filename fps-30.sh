#!/bin/bash

input_file="$1"
output_file="${input_file%.*}_30fps.mp4"

ffmpeg -i "$input_file" -filter:v fps=fps=30 -c:a copy "$output_file"
