## Sometimes you can do great things just if you have the right function. By having the right function you just need to call it. Sometimes calling the function needs to parametrize it which is very easy in compare to wring the whole function. Shellman have a namespace calling fn/fx which means by fn blah you insert a function in your code and bu fx blah you call your function. You can do amazing things like making animations by fn/fx.

### [animation frame | fn animation animate | fx animation animate]{#animation}

besides `fn animation` and `fx animation animate` we need to borrow `animation frame` from `misc` namespace. The latter is responsible to hold your frames. Be careful your frames should be exact size. It means if a line is shorter than the longest line you should fill it by space. Then `fn animate` is responsible to animate fames as `fx animation animate` tells it. There are multiple example on website but I give a small taste here:

```bash
#!/usr/bin/env bash

# Your frames need to have the exact same width and height.
# If they are different in size, fill unused space with `space`s (no `TAB`s).
IFS='' read -r -d '' "frames[1]" <<"EOF"
# -
EOF

IFS='' read -r -d '' "frames[2]" <<"EOF"
# /
EOF

IFS='' read -r -d '' "frames[3]" <<"EOF"
# -
EOF

IFS='' read -r -d '' "frames[4]" <<"EOF"
# \
EOF

IFS='' read -r -d '' "frames[5]" <<"EOF"
# |
EOF

# Usage: animate framesArray interval
function animate () {
    local frames=("$@")

    ((lastIndex=${#frames[@]} - 1))
    local mode=${frames[lastIndex]}
    unset "frames[lastIndex]"

    ((lastIndex=${#frames[@]} - 1))
    local interval=${frames[lastIndex]}
    unset "frames[lastIndex]"

    # Comment out next two lines if you are using CTRL+C event handler.
    trap 'tput cnorm; echo' EXIT
    trap 'exit 127' HUP INT TERM

    tput civis # hide cursor
    tput sc # save cursor position

    tput civis # hide cursor
    tput sc # save cursor position

    index=0
    max="${#frames[@]}"
    indices=()
    direction="forward"
    readarray -t forwardIndices < <(seq 0 1 "${max}")
    readarray -t backwardIndices < <(seq "${max}" -1 0)

    while true; do
        if [ "${mode}" = "circular" ]; then
            direction="forward"
        elif [ "${mode}" = "pendular" ]; then
            if (( index >= max )); then
                direction="backward"
            elif (( index <= 0 )); then
                direction="forward"
            fi
        else
            echo "Wrong mode! Valid modes: circular, pendular"
            exit 255
        fi

        if [ "${direction}" = "forward" ]; then
            indices=( "${forwardIndices[@]}" )
        else
            indices=( "${backwardIndices[@]}" )
        fi
        

        for index in "${indices[@]}"; do
            tput rc # restore cursor position
            echo "${frames[$index]}"
            sleep "${interval}"
        done
    done
}

# Usage: animate framesArray interval
animate "${frames[@]}" 0.1 circular
```

### fn animation pacman / fx animation pacman

This is a ready to use animation. Pacman eats your letters.

```bash
#!/usr/bin/env bash

# Usage: pacMan inputString interval pad
# Example: pacman "Hello World" 0.5 "*"
function pacMan () {
    local string="${1}"
    local interval="${2}"
    : "${interval:=0.2}"
    local pad="${3}"
    : "${pad:=.}"
    local length=${#string}
    local padding=""

    # Comment out next two lines if you are using CTRL+C event handler.
    trap 'tput cnorm; echo' EXIT
    trap 'exit 127' HUP INT TERM

    tput civis # hide cursor
    tput sc # save cursor position

    for((i=0;i<=length;i++)); do
        tput rc
        echo "${padding}c${string:i:length}"
        sleep "$interval"
        tput rc
        echo "${padding}C${string:i:length}"
        sleep "${interval}"
        padding+="${pad}"
    done

    tput cnorm
    tput rc
    echo "${padding}"
}

# Usage: pacMan inputString interval pad
pacMan "Hello World" 0.1 "."
```

### fn banner simple fx banner simple

Create a simple banner around your text.

```bash

#!/usr/bin/env bash

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
```

### fn banner color / fx banner color

```bash
#!/usr/bin/env bash

# Usage: bannerColor "my title" "red" "*"
function bannerColor() {
    case ${2} in
        black) color=0
        ;;
        red) color=1
        ;;
        green) color=2
        ;;
        yellow) color=3
        ;;
        blue) color=4
        ;;
        magenta) color=5
        ;;
        cyan) color=6
        ;;
        white) color=7
        ;;
        *) echo "color is not set"; exit 1
        ;;
    esac

    local msg="${3} ${1} ${3}"
    local edge
    edge=${msg//?/$3}
    tput setaf ${color}
    tput bold
    echo "${edge}"
    echo "${msg}"
    echo "${edge}"
    tput sgr 0
    echo
}

# Usage: bannerColor "my title" "red" "*"
bannerColor "my title" "yellow" "*"
```

### fn import / fx import

If you put your functions in a directory named `lib` by `import` you can easily import those functions into main script.

```bash
#!/usr/bin/env bash

# Usage: import "mylib"
function import() {
    local file="./lib/${1}.sh"
    if [ -f "${file}" ]; then
        source "${file}"
    else
        echo "Error: Cannot find library at: ${file}"
        exit 1
    fi
}

# Usage: import "filename"
import "libname"
```

### fn options / fx options | fn input choice / fx input choice

This function gives user multiple choices to select one.

```bash
#!/usr/bin/env bash

# Usage: options=("one" "two" "three"); inputChoice "Choose:" 1 "${options[@]}"; choice=$?; echo "${options[$choice]}"
function inputChoice() {
    echo "${1}"; shift
    echo "$(tput dim)""- Change option: [up/down], Select: [ENTER]" "$(tput sgr0)"
    local selected="${1}"; shift

    ESC=$(echo -e "\033")
    cursor_blink_on()  { tput cnorm; }
    cursor_blink_off() { tput civis; }
    cursor_to()        { tput cup $(($1-1)); }
    print_option()     { echo "$(tput sgr0)" "$1" "$(tput sgr0)"; }
    print_selected()   { echo "$(tput rev)" "$1" "$(tput sgr0)"; }
    get_cursor_row()   { IFS=';' read -rsdR -p $'\E[6n' ROW COL; echo "${ROW#*[}"; }
    key_input()        { read -rs -n3 key 2>/dev/null >&2; [[ $key = ${ESC}[A ]] && echo up; [[ $key = ${ESC}[B ]] && echo down; [[ $key = "" ]] && echo enter; }

    for opt; do echo; done

    local lastrow
    lastrow=$(get_cursor_row)
    local startrow=$((lastrow - $#))
    trap "cursor_blink_on; echo; echo; exit" 2
    cursor_blink_off

    : selected:=0

    while true; do
        local idx=0
        for opt; do
            cursor_to $((startrow + idx))
            if [ ${idx} -eq "${selected}" ]; then
                print_selected "${opt}"
            else
                print_option "${opt}"
            fi
            ((idx++))
        done

        case $(key_input) in
            enter) break;;
            up)    ((selected--)); [ "${selected}" -lt 0 ] && selected=$(($# - 1));;
            down)  ((selected++)); [ "${selected}" -ge $# ] && selected=0;;
        esac
    done

    cursor_to "${lastrow}"
    cursor_blink_on
    echo

    return "${selected}"
}

# Usage: options=("one" "two" "three"); inputChoice "Choose:" 1 "${options[@]}"; choice=$?; echo "${options[$choice]}"
options=("one" "two" "three")
inputChoice "Choose:" 0 "${options[@]}"; choice=$?
echo "${options[$choice]}" selected
```

### fn checkbox | fn input multichoice

User can have multiple choices.

```bash
#!/usr/bin/env bash

# Usage: multiChoice "header message" resultArray "comma separated options" "comma separated default values"
# Credit: https://serverfault.com/a/949806
function multiChoice {
    echo "${1}"; shift
    echo "$(tput dim)""- Change Option: [up/down], Change Selection: [space], Done: [ENTER]" "$(tput sgr0)"
    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()   { printf "%s" "${ESC}[?25h"; }
    cursor_blink_off()  { printf "%s" "${ESC}[?25l"; }
    cursor_to()         { printf "%s" "${ESC}[$1;${2:-1}H"; }
    print_inactive()    { printf "%s   %s " "$2" "$1"; }
    print_active()      { printf "%s  ${ESC}[7m $1 ${ESC}[27m" "$2"; }
    get_cursor_row()    { IFS=';' read -rsdR -p $'\E[6n' ROW COL; echo "${ROW#*[}"; }
    key_input()         {
        local key
        IFS= read -rsn1 key 2>/dev/null >&2
        if [[ $key = ""      ]]; then echo enter; fi;
        if [[ $key = $'\x20' ]]; then echo space; fi;
        if [[ $key = $'\x1b' ]]; then
            read -rsn2 key
            if [[ $key = [A ]]; then echo up;    fi;
            if [[ $key = [B ]]; then echo down;  fi;
        fi
    }
    toggle_option()    {
        local arr_name=$1
        eval "local arr=(\"\${${arr_name}[@]}\")"
        local option=$2
        if [[ ${arr[option]} == 1 ]]; then
            arr[option]=0
        else
            arr[option]=1
        fi
        eval "$arr_name"='("${arr[@]}")'
    }

    local retval=$1
    local options
    local defaults

    IFS=';' read -r -a options <<< "$2"
    if [[ -z $3 ]]; then
        defaults=()
    else
        IFS=';' read -r -a defaults <<< "$3"
    fi

    local selected=()

    for ((i=0; i<${#options[@]}; i++)); do
        selected+=("${defaults[i]}")
        printf "\n"
    done

    # determine current screen position for overwriting the options
    local lastrow
    lastrow=$(get_cursor_row)
    local startrow=$((lastrow - ${#options[@]}))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local active=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for option in "${options[@]}"; do
            local prefix="[ ]"
            if [[ ${selected[idx]} == 1 ]]; then
                prefix="[x]"
            fi

            cursor_to $((startrow + idx))
            if [ $idx -eq $active ]; then
                print_active "$option" "$prefix"
            else
                print_inactive "$option" "$prefix"
            fi
            ((idx++))
        done

        # user key control
        case $(key_input) in
            space)  toggle_option selected $active;;
            enter)  break;;
            up)     ((active--));
                if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
            down)   ((active++));
                if [ "$active" -ge ${#options[@]} ]; then active=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to "$lastrow"
    printf "\n"
    cursor_blink_on

    indices=()
    for((i=0;i<${#selected[@]};i++)); do
        if ((selected[i] == 1)); then
            indices+=("${i}")
        fi
    done

    # eval $retval='("${selected[@]}")'
    eval "$retval"='("${indices[@]}")'
}

# Usage: multiChoice "header message" resultArray "comma separated options" "comma separated default values"
multiChoice "Select options:" result "One 1;Two 2;Three 3" "1;0;1"
echo "${result[@]}"
```

### fn math average fx math average

```bash
#!/usr/bin/env bash

# Usage: average int1 int2 ...
i=5
j=8
k=12

function average () {
    local sum=0
    for int in "$@"; do
        ((sum += int))
    done
    echo $((sum / $#))
}

# Usage: average int1 int2 ...
echo $(average "${i}" "${j}" "${k}") # 8
```

### fn math factorial / fx math factorial

```bash
# Usage: factorial n
factorial ()
{
    if (( $1 < 2 )); then
        echo 1
    else
        echo $(( $1 * $(factorial $(( $1 - 1 ))) ))
    fi
}

# Usage: factorial n
readarray -t result < <(factorial 5)
echo "${result[@]}" # 120
```

### fn math fibonacci series

An array of fibonacci series from zero to n.

```bash
# Usage: fibonacciSeries n
fibonacciSeries ()
{
    fib=()
    fib+=(0)
    fib+=(1)

    for((i=2;i<${1};i++)); do
        fib[i]=$((fib[i-1] + fib[i-2]))
    done

    echo "${fib[@]}"
}
# Usage: fibonacciSeries n
readarray -t result < <(fibonacciSeries 4)
echo "${result[@]}" # 0 1 1 2
```

### fn math fibonacci / fx math fibonacci

```bash
#!/usr/bin/env bash

# Usage: fibonacci n
fibonacci ()
{
    if (($1 < 2)); then 
        echo "$1"
    else
        echo $(($(fibonacci $(($1 - 1))) + $(fibonacci $(($1 - 2)))))
    fi
}

# Usage: fibonacci n
echo "$(fibonacci 9)" # 34
```

### fn math product / fx math product

```bash
#!/usr/bin/env bash

# Usage: product int1 int2 ...
function product () {
    local result=1
    for int in "$@"; do
        ((result *= int))
    done
    echo "${result}"
}

# Usage: product int1 int2 ...
int1=2; int2=5; int3=6
echo $(product ${int1} ${int2} ${int3}) # 60
```

### fn math sum / fx math sum

```bash
#!/usr/bin/env bash

# Usage: sum int1 int2 ...
function sum () {
    local result=0
    for int in "$@"; do
        ((result += int))
    done
    echo "${result}"
}

# Usage: sum int1 int2 ...
int1=5; int2=7; int3=9
echo $(sum ${int1} ${int2} ${int3}) # 21
```

### fn progress / fx progress

```bash
#!/usr/bin/env bash

# Usage: progressBar "message" currentStep totalSteps
function progressBar() {
    local   bar='████████████████████'
    local space='....................'
    local wheel=('\' '|' '/' '-')

    local msg="${1}"
    local current=${2}
    local total=${3}
    local wheelIndex=$((current % 4))
    local position=$((100 * current / total))
    local barPosition=$((position / 5))

    echo -ne "\r|${bar:0:$barPosition}$(tput dim)${space:$barPosition:20}$(tput sgr0)| ${wheel[wheelIndex]} ${position}% [ ${msg} ] "
}

# Usage: progressBar "message" currentStep totalSteps
totalSteps=100

for ((currentStep=1; currentStep <= totalSteps; currentStep++)); do
    sleep 0.1 # simulating one step of job
    progressBar "Installing foo..." "${currentStep}" "${totalSteps}"
done

echo
```

### fn scan local / fx scan local

```bash
#!/usr/bin/env bash

# Usage: scan proto host fromPort toPort
function scan () {
    local openPortsArray=()
    for ((port=${3}; port<=${4}; port++)); do
        (echo >/dev/"${1}"/"${2}"/"${port}") >/dev/null 2>&1 && openPortsArray+=("${port}")
    done
    echo "${openPortsArray[@]}"
}

# Usage: scan proto host fromPort toPort
readarray -t openPorts < <(scan tcp "localhost" 1000 5000)
echo "${openPorts[@]}"
```

### fn time format seconds

```bash
#!/usr/bin/env bash

# Usage: formatSeconds 70 -> 1m 10s
# Credit: https://unix.stackexchange.com/a/27014
function formatSeconds {
    local T=$1
    local D=$((T/60/60/24))
    local H=$((T/60/60%24))
    local M=$((T/60%60))
    local S=$((T%60))
    local result=""

    (( D > 0 )) && result="${D}d "
    (( H > 0 )) && result="${result}${H}h "
    (( M > 0 )) && result="${result}${M}m "
    (( S > 0 )) && result="${result}${S}s "
    echo -e "${result}" | sed -e 's/[[:space:]]*$//'
}

# Usage: formatSeconds 70 -> 1m 10s
readarray -t res < <(formatSeconds 80)
echo "${res[@]}"
```

### fn urlencode / fx urlencode

```bash
#!/usr/bin/env bash

# Usage: urlencode url
function urlencode () {
    local LC_ALL=C
    local c i n=${#1}
    for (( i=0; i<n; i++ )); do
        c="${1:i:1}"
        case "$c" in
            [[:alnum:].~_-]) printf '%s' "$c" ;;
            *) printf '%%%02x' "'$c" ;;
        esac
    done
}
# Usage: urlencode url
urlencode "Hello World!"
# Hello%20World%21        
```

### fn urldecode / fx urldecode

```bash
# Usage: urldecode url
function urldecode() {
: "${*//+/ }"; echo -e "${_//%/\x}";
}

urldecode "Hello%20World%21"
# Hello World!
```

### fn version compare | fn semver compare

```bash
#!/usr/bin/env bash

# Usage: versionCompare "1.2.3" "1.1.7"
function versionCompare () {
    function subVersion () {
        echo -e "${1%%"."*}"
    }
    function cutDot () {
        local offset=${#1}
        local length=${#2}
        echo -e "${2:((++offset)):length}"
    }
    if [ -z "${1}" ] || [ -z "${2}" ]; then
        echo "=" && exit 0
    fi
    local v1
    v1=$(echo -e "${1}" | tr -d '[:space:]')
    local v2
    v2=$(echo -e "${2}" | tr -d '[:space:]')
    local v1Sub
    v1Sub=$(subVersion "$v1")
    local v2Sub
    v2Sub=$(subVersion "$v2")
    if (( v1Sub > v2Sub )); then
        echo ">"
    elif (( v1Sub < v2Sub )); then
        echo "<"
    else
        versionCompare "$(cutDot "$v1Sub" "$v1")" "$(cutDot "$v2Sub" "$v2")"
    fi
}

# Usage: versionCompare "1.2.3" "1.1.7"
versionCompare "5.3.1" "5.2.8"
# >
```
