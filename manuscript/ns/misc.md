## miscellaneous

Contains `other` operations not available in namespaces.

### switch case

This is the `switch / case` you may be familiar in other languages. You can define different actions based on `switch`:

```bash
#!/usr/bin/env bash

var=2

case "$var" in
  1)
    echo "case 1"
  ;;
  2|3)
    echo "case 2 or 3"
  ;;
  *)
    echo "default action"
  ;;
esac
# case 2 or 3
```

In above example we are deciding on the value of `var` which here is 2. If `var` is 2 or 3 the second case will be triggered. If none of cases (1, 2 or 3) are triggered, `*` means default and that will be triggered. change `var` to 5 and output will be `default action`.

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

### ask question

Ask a question from user and receive its answer from input. It is possible to provide a default answer to the question.

```bash
#!/usr/bin/env bash

read -ep "What is your name? " -i Remisa ANSWER
echo "$ANSWER" # print user's answer
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

### sleep

Halt script for desired period in seconds `s`, minutes `m`, hours `h`, days `d`.

```bash
#!/usr/bin/env bash

sleep 2m
# halts script for 2 minutes
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
