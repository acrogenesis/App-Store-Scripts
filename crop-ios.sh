#!/bin/bash

if [ $# -eq 0 ]; then
 echo "Usage: $0 directory"
 exit 1
fi

dir="$1"

for img in "$dir"/*.{jpg,jpeg,png,gif}; do
 [ -f "$img" ] || continue
 magick "$img" -trim -gravity south -crop 988x1990+0+0 +repage "${img%.*}_cropped.${img##*.}"
done
