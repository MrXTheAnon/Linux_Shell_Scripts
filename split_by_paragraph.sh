#!/bin/bash

file="$1"
output_prefix="output_"

if [ -z "$file" ]; then
    echo "Please provide the input file."
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "File not found: $file"
    exit 1
fi

# Create the output directory
mkdir -p output

# Splitting the file by paragraphs using csplit
csplit -s -z "$file" '/^$/' '{*}' -f "$output_prefix"

# Remove the empty file created by csplit
# rm "${output_prefix}00"

# Rename the output files with a .txt extension
for f in "${output_prefix}"*; do
    # echo "$f"
    mv "$f" "output/${f}.txt"
done

echo "File split completed. Output files are located in the 'output' directory."

