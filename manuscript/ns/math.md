## math

Contains `Math` related operations. Math functions are available under `fn math ...` namespace.

### math + (add)

Given two variables, returns sum of them.

```bash
#!/usr/bin/env bash

var1=2
var2=3
result=$((var1 + var2))
echo "$result" # 5
```

### math - (subtract)

Given two variables, returns first minus second.

```bash
#!/usr/bin/env bash

var1=7
var2=5
result=$((var1 - var2))
echo "$result" # 2
```

### math * (multiply)

Given two variables, returns product of them.

```bash
#!/usr/bin/env bash

var1=3
var2=4
result=$((var1 * var2))
echo "$result" # 12
```

### math / (divide)

Given two variables, returns first divided by the second.

```bash
#!/usr/bin/env bash

var1=12
var2=4
result=$((var1 / var2))
echo "$result" # 3
```

### math ^ (power)

Exponentiate *base* to the *power*.

```bash
#!/usr/bin/env bash

echo $((2 ** 4)) # 16
echo $((3 ** 3)) # 27
```

### math square root

Returns square root of given number up to given *precision*.

Calculate square root of 2 up to 7 decimal points.

```bash
#!/usr/bin/env bash

var=2
result=`echo "scale=7;sqrt($var)" | bc`
echo "$result" # 1.4142135
```

### math ++ (increase)

Given a variables, adds one to it.

```bash
#!/usr/bin/env bash

var=7
echo $((++var)) # 8
```

### math -- (decrease)

Given a variable, subtracts one from it.

```bash
#!/usr/bin/env bash

var=8
echo $((--var)) # 7
```

### math % (modulus)

Given two variables, returns reminder of dividing the first variable to the second.

```bash
#!/usr/bin/env bash

var1=17
var2=5
reminder=$((var1 % var2))
echo "$reminder" # 2
```

### math %= (modulus assign)

Given two variables, calculates reminder of dividing the first variable to the second and assigns the result to the first variable.

```bash
#!/usr/bin/env bash

var1=13
var2=5
((var1 %= var2))
echo "$var1" # 3
```

### math *= (multiply assign)

Given two variables, calculates product of them and assigns the result to the first variable.

```bash
#!/usr/bin/env bash

var1=2
var2=3
((var1 *= var2))
echo "$var1" # 6
```

X> ## Factorial
X>
X> Write a function which gets a number `N` and prints `N!`.

For the answer refer to [Solutions](#solutions) section, [factorial](#factorial).

### math += (add assign)

Given two variables, calculates sum of them and assigns the result to the first variable.

```bash
#!/usr/bin/env bash

var1=2
var2=3
((var1 += var2))
echo "$var1" # 5
```

### math -= (subtract assign)

Given two variables, calculates first variable minus the second and assigns the result to the first variable.

```bash
#!/usr/bin/env bash

var1=19
var2=15
((var1 -= var2))
echo "$var1" # 4
```

### math /= (divide assign)

Given two variables, divides first variable by second and assigns the result to the first.

```bash
#!/usr/bin/env bash

var1=12
var2=4
((var1 /= var2))
echo "$var1" # 3
```

### math 0.00 (precision)

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

### math random

Generate random number between *min* and *max*

```bash
#!/usr/bin/env bash

echo $((5000 + RANDOM % $((65535-5000)))) # 27502
```

### math constants

Some useful math constants.

- Pi = 3.14159265358979323846264338327950288
- Euler's number = 2.71828182845904523536028
- Gamma = 0.57721566490153286060651209008240
- Omega = 0.56714329040978387299996866221035
- Phi = 1.6180339887498948482045868343656381
