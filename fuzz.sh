#! /usr/bin/env bash

if (( $# < 2 )); then
    echo "Usage: $0 exec file [n] [seed]"

else
    # Set dafualt values
    N=${3-3}
    SEED=${4-234}
    cat $2 | while read line
    do
        echo $line | radamsa -n $N --seed $SEED
    done
fi


