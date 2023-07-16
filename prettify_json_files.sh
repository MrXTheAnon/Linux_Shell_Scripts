#!/bin/bash

# Function to prettify a JSON file using the Python script
prettify_json_file() {
    json_file="$1"
    prettified_json=$(python3 /home/aaron/Testing\ Shell/json_prettifier.py < "$json_file")
    echo "$prettified_json" > "$json_file"
}

# Find all JSON files in the current directory and its subdirectories
find . -type f -name "*.json" | while read -r json_file; do
    prettify_json_file "$json_file"
done

