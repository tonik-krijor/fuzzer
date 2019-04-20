#! /usr/bin/env bash

if (( $# < 3 )); then
    echo "Usage: $0 exec_path exec_name file [n] [k] [seed]"
else
    # Set dafualt values
    N=${4-3}
    K=${5-5}
    SEED=${6-234}

    tmp_diff=tmp_diff.txt
    cat $3 > $tmp_diff
    output=`cat $3`

    # Dry run with original file
    while read line
    do
        $1 $line >/dev/null 2>&1
    done < "$3"

    for ((i=0; i< $K; i++))
    do
        diff=`./fuzz.sh $1 $tmp_diff $N $SEED | ./prune.sh $1 $2`
        output+=$diff
        echo "$diff" > $tmp_diff

    done
    echo "$output"
fi
