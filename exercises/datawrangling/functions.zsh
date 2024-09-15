#!/usr/bin/env bash


pidwait() {
    local pid="$1"
    local timeout="${2:-300}"
    local start_time="$(date +%s)"
    local elapsed=0

    if ! kill -0 "$pid" 2> /dev/null; then
        echo "Proccess with $pid does not exits"
        return 1
    fi

    echo "waiting for Proccess $pid to finish ..."
    while kill -0 "$pid" 2> /dev/null; do 
        sleep 1
        elapsed=$(($(date +%s) - start_time))
        if [ "$elapsed" -ge "$timeout" ]; then
            echo "Timeout reached after $timeout seconds."
            return 2
        fi
    done

    echo "Process $pid finished after $elapsed seconds."
    return 0

}


