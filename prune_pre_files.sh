#! /usr/bin/env bash

docker build -t fuzz .
mkdir -p init # The pruned files will be saved in the 'init' directory.

declare -a binaries=("cat" "cp" "date" "dd" "df" "dir" "echo"
                     "false" "ln" "ls" "mkdir" "mktemp" "mv"
                     "printf" "pwd" "sleep" "touch" "true" "uname" "vdir")

for binary in "${binaries[@]}"
do
  echo "Pruning $binary"

  cov_target=$binary

  # dir and vdir are aliases for ls
  if [[ "$binary" == "dir" ]] || [ "$binary" == "vdir" ]; then
    cov_target="ls"
  fi

  docker run --rm fuzz ./prune.sh coreutils/src/$binary $cov_target pre/$binary.txt > init/$binary.txt
done
