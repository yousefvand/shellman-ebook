## string

Contains `String` related operations.

### contains

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

### equal

Checks if two `String`s are the same.

```bash
#!/usr/bin/env bash

string1='This is a string!'
string2='This is a string!'

if [ "$string1" = "$string2" ]; then
  echo 'Strings are equal'
fi
```

### indexOf

Returns index of substring inside a string.

```bash
#!/usr/bin/env bash

myString="Hello World!"
temp=${myString%%"or"*} && indexOf=`echo ${myString%%"or"*} | echo ${#temp}`
echo $indexOf # 7
```

### length

Returns *length* of given string.

```bash
#!/usr/bin/env bash

var="abcdefg"
length=${#var}
echo "$length"
```

### not equal

Checks if two strings are not equal.

```bash
#!/usr/bin/env bash

str1="shellman"
str2="shellmen"
if [ "$str1" != "$str2" ]; then
  echo "Strings are NOT equal"
fi
```

### replace

Replace a substring with given string in another string.

```bash
#!/usr/bin/env bash

str1="Hello World!"
replaced=`echo -e "${str1}" | sed -e 's/World/Everyone/g'`
echo "$replaced" # Hello Everyone!
```

### reverse

Reverse given string.

```bash
#!/usr/bin/env bash

str1="abcd"
reversed=`echo -e "${str1}" | rev`
echo "$reversed" # dcba
```

### substring

Returns a substring from given string starting at *index* and with the length of *length*.

```bash
#!/usr/bin/env bash

str1="abcdefg"
substring=`echo -e "${str1:2:3}"`
echo "$substring" # cde
```

In above example we want a substring starting at *index* 2 to the *length* of 3. In `abcdefg` index 2 is `c` (index starts at zero) and length of 3 will end up `cde`.

### toLower

Returns lowercase of given string.

```bash
#!/usr/bin/env bash

str1="AbCdE"
toLower=`echo -e "${str1}" | tr '[:upper:]' '[:lower:]'`
echo "$toLower" # abcde
```

### toUpper

Returns uppercase of given string.

```bash
#!/usr/bin/env bash

str1="AbCdE"
toLower=`echo -e "${str1}" | tr '[:upper:]' '[:lower:]'`
echo "$toLower" # abcde
```

### trim

Removes leading and trailing whitespace(s).

```bash
#!/usr/bin/env bash

str1="   result  "
result=`echo -e "${str1}" |  sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//'`
echo "Variable $result contains no leading and trailing space as you see"
# Variable result contains no leading and trailing space as you see
```

### trim all

Removes all whitespace(s) from given string (leading, inside, trailing).

```bash
#!/usr/bin/env bash

str1="   ab c de  "
result=`echo -e "${str1}" | tr -d '[[:space:]]'`
echo "All whitespaces are removed from $result as you see"
# All whitespaces are removed from abcde as you see
```

### trim left

Removes all whitespace(s) from left of given string (leading).

```bash
#!/usr/bin/env bash

str1="   whitespace on left"
result=`echo -e "${str1}" | sed -e 's/^[[:space:]]*//'`
echo "There is no $result as you see"
# There is no whitespace on left as you see
```

### trim right

Removes all whitespace(s) from right of given string (trailing).

```bash
#!/usr/bin/env bash

str1="whitespace on right   "
result=`echo -e "${str1}" | sed -e 's/[[:space:]]*$//'`
echo "There is no $result as you see"
# There is no whitespace on right as you see
```
