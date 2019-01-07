## math

Contains `Math` related operations. Math functions are available under `fn math ...` namespace.

### reminder %

Given two numbers, returns reminder of dividing the first number to the second number.

```bash
#!/usr/bin/env bash

var1=17
var2=5
reminder=$((var1 % var2))
echo "$reminder" # 2
```

### multiply *

Given two numbers, returns product of them.

```bash
#!/usr/bin/env bash

var1=3
var2=4
result=$((var1 * var2))
echo "$result" # 12
```

X> ## Factorial
X>
X> Write a function which gets a number `N` and prints `N!`.

For the answer refer to [Solutions](#solutions) section, [factorial](#factorial).

### add +

Given two numbers, returns sum of them.

```bash
#!/usr/bin/env bash

var1=2
var2=3
result=$((var1 + var2))
echo "$result" # 5
```

### increase ++

Given a number, adds one to it.

```bash
#!/usr/bin/env bash

var=7
echo $((++var)) # 8
```

### subtract -

Given two numbers, returns subtract of the second from the first.

```bash
#!/usr/bin/env bash

var1=7
var2=5
result=$((var1 - var2))
echo "$result" # 2
```

### decrease --

Given a number, subtracts one from it.

```bash
#!/usr/bin/env bash

var=8
echo $((--var)) # 7
```

### divide /

Given two numbers, returns first divided by the second.

```bash
#!/usr/bin/env bash

var1=12
var2=4
result=$((var1 / var2))
echo "$result" # 3
```

### scale 0.00

Math operations with `x` decimal point precision.

Multiply example:

```bash
#!/usr/bin/env bash

var1="2.13"
var2=""2
result=`echo "scale=2;($var1 * $var2)" | bc`
echo "$result" # 4.26
```

Division example:

```bash
#!/usr/bin/env bash

var1=7
var2=2
result=`echo "scale=2;($var1 / $var2)" | bc`
echo "$result" # 3.50
```

### exponentiation ^

Exponentiate *base* to the *power*.

```bash
#!/usr/bin/env bash

echo $((2 ** 4)) # 16
echo $((3 ** 3)) # 27
```

### square root

Returns square root of given number up to given *precision*.

Calculate square root of 2 up to 7 decimal points.

```bash
#!/usr/bin/env bash

var=2
result=`echo "scale=7;sqrt($var)" | bc`
echo "$result" # 1.4142135
```

### random

Generate random number between *min* and *max*

```bash
#!/usr/bin/env bash

echo $((5000 + RANDOM % $((65535-5000)))) # 27502
```

### constants

Some useful math constants.
