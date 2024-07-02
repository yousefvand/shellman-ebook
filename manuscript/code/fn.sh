#!/usr/bin/env bash

# Usage: banner_simple "my title"

# Usage: bannerSimple "my title" "*"
function bannerSimple() {
    local msg="${2} ${1} ${2}"
    local edge
    edge=${msg//?/$2}
    echo "${edge}"
    echo "$(tput bold)${msg}$(tput sgr0)"
    echo "${edge}"
    echo
}

# Usage: bannerSimple "my title" "*"
bannerSimple "my title" "*"

************
* my title *
************
