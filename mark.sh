#! /usr/bin/env bash

if (( $# < 2 )); then
    echo "Usage: $0 exec_path exec_name [file]"
else
    PRG=$2
    while read -r line
    do
        output=`$1 $line 2> /dev/null`
        retVal=$?
    done < "${3:-/dev/stdin}"
    cov=`gcov $1 2>/dev/null | grep -Eo '[0-9]+\.[0-9]+% of [0-9]+' | awk '{TOTAL+=$3; PART+=($1 * $3)} END {print PART/TOTAL}'`
    echo "$cov"
fi
