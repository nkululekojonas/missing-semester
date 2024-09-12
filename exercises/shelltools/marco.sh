#!/usr/bin/env sh

# Setup defaul location
MARCO_DIR="$HOME"

# Save the current working direcoty to retrive with ./polo
marco() {
    MARCO_DIR="$(PWD)"
    export MARCO_DIR
}



