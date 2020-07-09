## string

Contains `String` related operations.

### string concat

concatenates two strings

```bash
#!/usr/bin/env bash

str1="a"
str2="b"
str="${str1}y${str2}z"
echo "$str" # aybz
```

### string contains | if string contains

Checks if a `String` contains another `String` (substring).

```bash
#!/usr/bin/env bash

var="hello world!"

if [[ "$var" = *world* ]]; then
  echo "substring found"
else
  echo "substring NOT found"
fi
```

### string equal | if string =

Checks if two `String`s are the same.

```bash
#!/usr/bin/env bash

string1='This is a string!'
string2='This is a string!'

if [ "$string1" = "$string2" ]; then
  echo 'Strings are equal'
fi
```

### string not equal | if string !=

Checks if two strings are not equal.

```bash
#!/usr/bin/env bash

str1="shellman"
str2="shellmen"
if [ "$str1" != "$str2" ]; then
  echo "Strings are NOT equal"
fi
```

### string indexOf

Returns index of substring inside a string.

```bash
#!/usr/bin/env bash

myString="Hello World!"
temp=${myString%%"or"*} && indexOf=`echo ${myString%%"or"*} | echo ${#temp}`
echo $indexOf # 7
```

### if string empty

Check if variable is an empty string.

```bash
#!/usr/bin/env bash

var=""
if [ -z "$var" ]; then
  echo "Variable is empty string."
fi
# Variable is empty string.
```

### if string not empty

Check if variable is not an empty string.

```bash
#!/usr/bin/env bash

var="something"
if [ -n "$var" ]; then
  echo "Variable is not an empty string."
fi
# Variable is not an empty string.
```

### string length

Returns *length* of given string.

```bash
#!/usr/bin/env bash

var="abcdefg"
length=${#var}
echo "$length"
```

### string replace

Replace a substring with given string in another string.

```bash
#!/usr/bin/env bash

str1="Hello World!"
replaced=`echo -e "${str1}" | sed -e 's/World/Everyone/g'`
echo "$replaced" # Hello Everyone!
```

### string reverse

Reverse given string.

```bash
#!/usr/bin/env bash

str1="abcd"
reversed=`echo -e "${str1}" | rev`
echo "$reversed" # dcba
```

### string substring

Returns a substring from given string starting at *index* and with the length of *length*.

```bash
#!/usr/bin/env bash

str1="abcdefg"
substring=`echo -e "${str1:2:3}"`
echo "$substring" # cde
```

In above example we want a substring starting at *index* 2 to the *length* of 3. In `abcdefg` index 2 is `c` (index starts at zero) and length of 3 will end up `cde`.

### string substring count | string substring frequency

Finds the frequency of a substring in a string (may need character escaping).

```bash
#!/usr/bin/env bash

frequency=`sed -E 's/(.)/\1\n/g' <<<"a!bc!def!" | grep -c "!"`
echo "${frequency}" # 3
```

### string toLower

Returns lowercase of given string.

```bash
#!/usr/bin/env bash

str1="AbCdE"
toLower=`echo -e "${str1}" | tr '[:upper:]' '[:lower:]'`
echo "$toLower" # abcde
```

### string toUpper

Returns uppercase of given string.

```bash
#!/usr/bin/env bash

str1="AbCdE"
toLower=`echo -e "${str1}" | tr '[:upper:]' '[:lower:]'`
echo "$toLower" # abcde
```

### string trim

Removes leading and trailing whitespace(s).

```bash
#!/usr/bin/env bash

str1="   result  "
result=`echo -e "${str1}" |  sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//'`
echo "Variable $result contains no leading and trailing space as you see"
# Variable result contains no leading and trailing space as you see
```

### string trim all

Removes all whitespace(s) from given string (leading, inside, trailing).

```bash
#!/usr/bin/env bash

str1="   ab c de  "
result=`echo -e "${str1}" | tr -d '[[:space:]]'`
echo "All whitespaces are removed from $result as you see"
# All whitespaces are removed from abcde as you see
```

### string trim left

Removes all whitespace(s) from left of given string (leading).

```bash
#!/usr/bin/env bash

str1="   whitespace on left"
result=`echo -e "${str1}" | sed -e 's/^[[:space:]]*//'`
echo "There is no $result as you see"
# There is no whitespace on left as you see
```

### string trim right

Removes all whitespace(s) from right of given string (trailing).

```bash
#!/usr/bin/env bash

str1="whitespace on right   "
result=`echo -e "${str1}" | sed -e 's/[[:space:]]*$//'`
echo "There is no $result as you see"
# There is no whitespace on right as you see
```
