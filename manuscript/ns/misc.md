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

### region

Create a region to separate different parts of *script*.

```bash
#!/usr/bin/env bash

# >>>>>>>>>>>>>>>>>>>>>>>> variables >>>>>>>>>>>>>>>>>>>>>>>>
var=1
# <<<<<<<<<<<<<<<<<<<<<<<< variables <<<<<<<<<<<<<<<<<<<<<<<<
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

### ips

Array of local IPs.

```bash
#!/usr/bin/env bash

IPS=`hostname -I`
echo "$IPS"
```

### ip info

public ip information (ip, city, region, country, location, postal code, organization).

```bash
#!/usr/bin/env bash

echo `curl -s ipinfo.io/country`
# U.K
```

### ip public

Find public ip address via different services.

- bot.whatismyipaddress.com
- ident.me
- ipecho.net/plain
- icanhazip.com
- ifconfig.me
- api.ipify.org
- ipinfo.io/ip

```bash
#!/usr/bin/env bash

PUBLIC_IP=`curl -s api.ipify.org`
echo "$PUBLIC_IP"
```

### service manager

Commands related to *services*. A *service* is a program which runs in background.

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

Use *stopwatch* to calculate script running time.

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