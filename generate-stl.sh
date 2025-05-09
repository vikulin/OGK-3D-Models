#!/bin/bash
mkdir -p build
for file in ./Enclosure/*.scad; do
    filePath="${file%.*}"
    inferredPath=$(echo "$filePath" | sed "s/.\/Enclosure\///g")
    # For debugging
    # echo "$filePath -> $inferredPath"
    openscad "$filePath.scad" -o "./build/$inferredPath.stl"
done