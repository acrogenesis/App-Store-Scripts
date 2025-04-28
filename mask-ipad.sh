#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 directory"
  exit 1
fi

dir="$1"

for img in "$dir"/*.{jpg,jpeg,png,gif}; do
  [ -f "$img" ] || continue
  output="${img%.*}_masked.${img##*.}"
  magick "$img" -gravity Center mask-ipad.png -compose DstIn -composite -trim +repage "$output"
  echo "Masked $img to $output"
done
