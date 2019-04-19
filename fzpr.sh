#! /usr/bin/env bash

if (( $# < 3 )); then
    echo "Usage: $0 exec_path exec_name file [n] [k] [seed]"
else
    # Set dafualt values
    N=${4-3}
    K=${5-5}
    SEED=${6-234}

    tmp_location=/tmp/tmp.txt
    tmp_diff=/tmp/tmp_diff.txt
    cat $3 > $tmp_location
    cat $3 > $tmp_diff

    for ((i=0; i< $K; i++))
    do
        output=`./fuzz.sh $1 $tmp_diff $N $SEED | ./prune.sh $1 $2`
        echo "$output" > $tmp_diff
        echo "$output"

    done >> $tmp_location
    cat $tmp_location
fi
