#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 directory"
  exit 1
fi

dir="$1"
cd "$dir" || exit

# Create temp directory
mkdir -p temp_seq
counter=1

# Create numbered sequence of symlinks in random order
find . -maxdepth 1 -name "*.png" | sort -R | while read -r file; do
  ln -s "../$file" "temp_seq/$(printf "%04d" $counter).png"
  ((counter++))
done

# Create GIF from numbered sequence
ffmpeg -framerate 2.5 -i "temp_seq/%04d.png" -filter_complex "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse" ../output.gif

# Cleanup
rm -r temp_seq
