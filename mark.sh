#! /usr/bin/env bash

if (( $# < 2 )); then
    echo "Usage: $0 exec_path exec_name [file]"
else
    PRG=$2
    while read line
    do
        output=`$1 $line 2> /dev/null`
        retVal=$?
    done < "${3:-/dev/stdin}"
    cov=`gcov $1 2>/dev/null | grep $PRG -A 1 | grep -Eo '[0-9]+\.[0-9]+'`
    echo "$cov"
fi
