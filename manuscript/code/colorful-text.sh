#!/usr/bin/env bash

for((i=0;i<=7;i++)); do
  echo `tput setaf $i`Hello World!`tput sgr0`
done
