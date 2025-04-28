#!/bin/bash

usage() {
  echo "Usage: $0 -t type directory"
  echo "  -t type   Specify device type: ipad or iphone (required)"
  exit 1
}

# Parse options
while getopts "t:h" opt; do
  case ${opt} in
  t)
    type=${OPTARG}
    if [[ "$type" != "ipad" && "$type" != "iphone" ]]; then
      echo "Error: type must be either 'ipad' or 'iphone'"
      usage
    fi
    ;;
  h | *)
    usage
    ;;
  esac
done

# Shift the options so $1 becomes the directory
shift $((OPTIND - 1))

if [ $# -eq 0 ]; then
  echo "Error: Directory not specified"
  usage
fi

if [ -z "$type" ]; then
  echo "Error: Device type (-t) is required"
  usage
fi

dir="$1"
mask_file="mask-${type}.png"

if [ ! -f "$mask_file" ]; then
  echo "Error: Mask file $mask_file not found"
  exit 1
fi

echo "Using $mask_file for masking images in $dir"

for img in "$dir"/*.{jpg,jpeg,png,gif}; do
  [ -f "$img" ] || continue
  output="${img%.*}_masked_${type}.${img##*.}"
  magick "$img" -gravity Center "$mask_file" -compose DstIn -composite -trim +repage "$output"
  echo "Masked $img to $output"
done
