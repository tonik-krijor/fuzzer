#! /usr/bin/env bash

docker build -t fuzz .
mkdir -p final # The fuzzed files will be saved in the 'final' directory.

declare -a binaries=("cat" "cp" "date" "dd" "df" "dir" "echo"
                     "false" "ln" "ls" "mkdir" "mktemp" "mv"
                     "printf" "pwd" "sleep" "touch" "true" "uname" "vdir")

for binary in "${binaries[@]}"
do
  echo "Fuzzing $binary"

  cov_target=$binary

  # dir and vdir are aliases for ls
  if [[ "$binary" == "dir" ]] || [ "$binary" == "vdir" ]; then
    cov_target="ls"
  fi

  if [[ "$binary" == "false" ]]; then
    cov_target="true"
  fi

  docker run --rm fuzz ./fzpr.sh coreutils/src/$binary $cov_target init/$binary.txt 20 100 > final/$binary.txt
done
