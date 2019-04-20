#! /usr/bin/env bash

if (( $# < 2 )); then
    echo "Usage: $0 exec_path exec_name [file]"
else
    PRG=$2
    cov_max=`gcov $1 2>/dev/null | grep $PRG -A 1 | grep -Eo '[0-9]+\.[0-9]+'`
    while read line
    do
        # Prune the results - remove stuff that doesn't increase coverage
        output=`$1 $line 2> /dev/null`
        retVal=$?
        cov=`gcov $1 2>/dev/null | grep $PRG -A 1 | grep -Eo '[0-9]+\.[0-9]+'`
        tmp=`echo -e "$cov\n$cov_max" | sort -n | tail -n 1`
        if [ "$cov" = "$tmp" ] && [ "$cov" != "$cov_max" ]; then
            cov_max=$cov
            echo $line
            (>&2 echo -ne "\r$cov")
        fi
    done < "${3:-/dev/stdin}"
fi
