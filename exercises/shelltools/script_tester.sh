#!/usr/bin/env bash

# Check if a source script was provided
if [ $# -eq 0 ]; then
    echo "Error: No source script provided"
    echo "Usage: $0 <path_to_script>"
    exit 1
fi

# Setup source and destination file
SOURCE_SCRIPT="$1"
STD_OUT="output_$$.log"
STD_ERR="error_$$.log"

# Set up counter
COUNTER=0

if [ ! -x "$SOURCE_SCRIPT" ]; then
    chmod +x "$SOURCE_SCRIPT" || exit 1
else 
    while true; do 
        (( COUNTER++ ))

        if ! ./"$SOURCE_SCRIPT" > "$STD_OUT" 2> "$STD_ERR"; then 
            echo "Script failed after $COUNTER runs" 
            echo "Contents of stdout:"
            cat "$STD_OUT"
            echo "Contents of stderr:"
            cat "$STD_ERR"
            break
        fi 
     done
 fi
