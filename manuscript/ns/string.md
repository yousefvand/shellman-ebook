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
  echo "Strings are equal"
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

Returns the first index of a substring inside a string.

```bash
#!/usr/bin/env bash

string="hello world"
substring="world"
prefix=${string%%"$substring"*}
index=${#prefix}
if [[ index -eq ${#string} ]]; then
    echo -1
else
    echo "$index" # 6
fi
```

### if string empty

Check if variable is an empty string.

```bash
#!/usr/bin/env bash

var=""
if [ -z "$var" ]; then
  echo "Variable is an empty string."
fi
# Variable is an empty string.
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

Returns _length_ of a given string.

```bash
#!/usr/bin/env bash

var="abcdefg"
length=${#var}
echo "$length" # 7
```

### string random

Generates a random string from specified characters with desired length.

```bash
    randomString=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16 ; echo '')
    echo "$randomString"
```

In above example random string is built up from characters `A-Z`, `a-z` and `0-9` and length of it would be 16 characters.

### string replace once

Replace the first substring with given string in another string.

```bash
#!/usr/bin/env bash

new="Everyone"
old="world"
string="Hello world"

result="${string/$old/$new}"
echo "$result" # Hello Everyone
```

### string replace all

Replace all the substrings with given string in another string.

```bash
#!/usr/bin/env bash

new="Everyone"
old="world"
string="Hello world, bye world"

result="${string//$old/$new}"
echo "$result" # Hello Everyone, bye Everyone
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

Returns a substring from given string starting at _index_ and with the length of _length_.

```bash
#!/usr/bin/env bash

string="abcdefg"
offset=2
length=3

substring=$(echo -e "${string:${offset}:${length}}")
echo "$substring" # cde
```

In above example we want a substring starting at _index_ 2 to the _length_ of 3. In `abcdefg` index 2 is `c` (index starts at zero) and length of 3 will end up `cde`.

### string substring count | string substring frequency

Finds the frequency of a substring in a string (may need character escaping).

```bash
#!/usr/bin/env bash

string="abcdefgcd"
substring="c"
tmp="${string//$substring}" && frequency=$(((${#string} - ${#tmp}) / ${#substring}))
echo "${frequency}" # 2
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
