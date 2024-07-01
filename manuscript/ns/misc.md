## miscellaneous

Contains `other` operations not available in namespaces.

### am I not root | am I not sudo

```bash
if (( $(id -u) != 0 )); then
    echo "I'm not root"
fi
```

### am I root | am I sudo

```bash
if (( $(id -u) == 0 )); then
    echo "I'm root"
fi
```

### animation frame

```bash
# Your frames need to have the exact same width and height.
# If they are different in size, fill unused space with `space`s (no `TAB`s).
IFS='' read -r -d '' "frames[1]" <<"EOF"
# Frame here
EOF
```

### argument parsing

```bash
POSITIONAL=()
while (( $# > 0 )); do
    case "${1}" in
        -f|--flag)
        echo flag: "${1}"
        shift # shift once since flags have no values
        ;;
        -s|--switch)
        numOfArgs=1 # number of switch arguments
        if (( $# < numOfArgs + 1 )); then
            shift $#
        else
            echo "switch: ${1} with value: ${2}"
            shift $((numOfArgs + 1)) # shift 'numOfArgs + 1' to bypass switch and its value
        fi
        ;;
        *) # unknown flag/switch
        POSITIONAL+=("${1}")
        shift
        ;;
    esac
done

set -- "${POSITIONAL[@]}" # restore positional params
```

### echo text | print text

```bash
echo 'text here'
```

### echo variable | print variable

```bash
echo "${variable}"
```

### exit code

```bash
exit 0
```

### os is

```bash
OS=$(awk -F'=' '/^ID=/ { gsub("\"","",$2); print tolower($2) }' /etc/*-release 2> /dev/null)
echo "$OS" #arch
```

### region {#region}

Creates a region to separate different parts of *script*.

```bash
#!/usr/bin/env bash

# >>>>>>>>>>>>>>>>>>>>>>>> variables >>>>>>>>>>>>>>>>>>>>>>>>
var=1
# <<<<<<<<<<<<<<<<<<<<<<<< variables <<<<<<<<<<<<<<<<<<<<<<<<
```

### summary {#summary}

Creates a commented summary for shell script. Use it at the top of your script.

```bash
#!/usr/bin/env bash

# Title:         title
# Description:   description
# Author:        author <email>
# Date:          yyyy-mm-dd
# Version:       1.0.0

# Exit codes
# ==========
# 0   no error
# 1   script interrupted
# 2   error description
```

Document your script error codes under `Exit codes` section. These are code you have used in script when it exits due to an error (i.e. `exit 5` for lack of permission to do the job).

### shebang | bash | first line

```bash
#!/usr/bin/env bash
```

### sleep

Halt script for desired period in seconds `s`, minutes `m`, hours `h`, days `d`.

```bash
#!/usr/bin/env bash

sleep 2m
# halts script for 2 minutes
```
 















### let

`let` is used for mathematic operations.

```bash
#!/usr/bin/env bash

let a=2+3
echo $a # 5
let "a = 2 + 3"
echo $a # 5
let a++ # increase a
echo $a # 6
let "a = 2 * 3"
echo $a # 6
```

### assign if empty | variable default value {#default-value}

Assigns a value to a variable if and only if the variable is empty. Useful for assigning default values.

```bash
#!/usr/bin/env bash

var=""
: "${var:=default}"
echo "$var" # default

var="something"
: "${var:=default}"
echo "$var" # something
```

### expr

It is and old command for doing *arithmetic operations*. Use `$(( ))` instead.

```bash
#!/usr/bin/env bash

result=`expr 2 \* 3`
echo "$result" # 6
```

Equivalent to:

```bash
#!/usr/bin/env bash

result=$((2 * 3))
echo "$result" # 6
```

### timeout

Run a command within a time frame.

```bash
#!/usr/bin/env bash

timeout 5 curl -s http://example.com
echo "at most 5 seconds later"
```

### service manager

Commands related to *services*. A *service* is a program which runs in background and doesn't need any user to login to be started (i.e. `ssh`).

```bash
#!/usr/bin/env bash

sudo systemctl restart service
```

### stopwatch

Use *stopwatch* to calculate script running time. There are three snippets related to `stopwatch`, use at the given order:

1. `stopwatch start`: Starts stopwatch.
2. `stopwatch stop`: Stops stopwatch.
3. `stopwatch elapsed`: Calculates total time.

```bash
#!/usr/bin/env bash

# beginning of script
STOPWATCH_START_TIME=$(date +%s)

# script
sleep 30s


# end of script
STOPWATCH_END_TIME=$(date +%s)

# print elapsed time
STOPWATCH_ELAPSED_TOTAL_SECONDS=$((STOPWATCH_END_TIME - STOPWATCH_START_TIME))
STOPWATCH_ELAPSED_MINUTES=$((STOPWATCH_ELAPSED_TOTAL_SECONDS / 60))
STOPWATCH_ELAPSED_SECONDS=$((STOPWATCH_ELAPSED_TOTAL_SECONDS % 60))
echo elapsed $STOPWATCH_ELAPSED_MINUTES minutes and $STOPWATCH_ELAPSED_SECONDS seconds
```
