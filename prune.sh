#! /usr/bin/env bash

if (( $# < 2 )); then
    echo "Usage: $0 exec_path exec_name [file]"
else
    PRG=$2
    cov_max=$(gcov $1 2>/dev/null | grep -Eo '[0-9]{1,3}\.[0-9]{2}' | awk '{ SUM += $1} END { print SUM }' )

    while read -r line; do
        # Prune the results - remove stuff that doesn't increase coverage
        timeout -t 1 $1 $line &> /dev/null
        retVal=$?
        if [[ $retVal == 143 ]]; then # Command timed out
            (>&2 echo "timeout")
            continue
        fi
        cov=$(gcov $1 2>/dev/null | grep -Eo '[0-9]{1,3}\.[0-9]{2}' | awk '{ SUM += $1} END { print SUM }' )
        if (( $(echo "$cov > $cov_max" | bc -l) )); then
            cov_max=$cov
            echo "$line"
            (>&2 echo "$cov")
        fi
    done < "${3:-/dev/stdin}"
fi
