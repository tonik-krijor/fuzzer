#! /usr/bin/env bash

docker build -t fuzz .
mkdir -p init # The pruned files will be saved in the 'init' directory.

declare -a binaries=("cat" "cp" "date" "dd" "df" "dir" "echo"
                     "false" "ln" "ls" "mkdir" "mktemp" "mv"
                     "printf" "pwd" "sleep" "touch" "true" "uname" "vdir")

for binary in "${binaries[@]}"
do
  echo "Pruning $binary"
  docker run --rm fuzz ./prune.sh coreutils/src/$binary $binary pre/$binary.txt > init/$binary.txt
done
