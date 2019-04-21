#! /usr/bin/env bash

docker build -t fuzz .

declare -a binaries=("cat" "cp" "date" "dd" "df" "dir" "echo"
                     "false" "ln" "ls" "mkdir" "mktemp" "mv"
                     "printf" "pwd" "sleep" "touch" "true" "uname" "vdir")

echo -n "" > coverage.txt
echo "Evaluating coverage..."

for binary in "${binaries[@]}"
do
  cov_target=$binary

  # dir and vdir are aliases for ls
  if [[ "$binary" == "dir" ]] || [ "$binary" == "vdir" ]; then
    cov_target="ls"
  fi

  if [[ "$binary" == "false" ]]; then
    cov_target="true"
  fi

  echo "$binary "$(docker run --rm fuzz ./mark.sh coreutils/src/$binary $cov_target final/$binary.txt)"%" >> coverage.txt
done

echo "Coverage saved to coverage.txt"
