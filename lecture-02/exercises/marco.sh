#!/bin/bash

marco()
{
    export POLO="$(pwd)" 
}

polo()
{
    cd "$POLO" || return 1
}
