#!/usr/bin/env bash

# Usage: banner_simple "my title"

function banner_simple() {
  local msg="* $* *"
  local edge=`echo "$msg" | sed 's/./*/g'`
  echo "$edge"
  echo "`tput bold`$msg`tput sgr0`"
  echo "$edge"
  echo
}

banner_simple "my title"
