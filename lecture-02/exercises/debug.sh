#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 file"
    exit 1
fi 

error_file="${1}-error.log"
output_file="${1}-output.log"

count=0
while true; do
    (( count++))

    if ! ./"$1" >> "$output_file" 2>> "$error_file"; then
        echo "Script failed after $count runs"
        echo ""
        echo "=== Standard Output ==="
        cat "$output_file"
        echo ""
        echo "=== Standard Error ==="
        cat "$error_file"
        break
    fi
done
