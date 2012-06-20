#!/bin/bash

# Check number of inputs
if [ $# -ne 2 ]; then
    echo "Needs two input arguments"
    exit 0
fi

# Split into 64-pixel-wide strips (base sprites are animated left-to-right)
convert "$1" -crop 64 +repage zzztmp.png
# Remove the first frame (each base sprite has a standing frame first)
rm zzztmp-0.png
# Animate
convert -delay 10 -loop 0 -dispose background zzztmp-*.png "$2"
# Remove temporary files
rm zzztmp-*.png
