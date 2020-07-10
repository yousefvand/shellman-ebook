#!/usr/bin/env bash

greeting="good night"
name="everyone"

# >>>>>>>>>>>>>>>>>>>>>>>> Argument parsing >>>>>>>>>>>>>>>>>>>>>>>>

POSITIONAL=()
while [[ $# > 0 ]]; do
  case "$1" in
    -m|--morning)
    greeting="good morning"
    shift # shift once since flags have no values
    ;;
    -n|--name)
    name="$2"
    shift 2 # shift twice to bypass switch and its value
    ;;
    *) # unknown flag/switch
    POSITIONAL+=("$1")
    shift
    ;;
  esac
done

set -- "${POSITIONAL[@]}" # restore positional params

# <<<<<<<<<<<<<<<<<<<<<<<< Argument parsing <<<<<<<<<<<<<<<<<<<<<<<<

echo "$greeting $name"
