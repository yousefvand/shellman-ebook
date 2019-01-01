#!/usr/bin/env bash

function fact () {
  result=1
  for((i=2;i<=$1;i++)); do
    result=$((result * i))
  done
  echo $result
}

# example: 4! = 4 * 3 * 2 = 24
fact 4